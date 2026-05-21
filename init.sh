#!/usr/bin/env bash
# init.sh — bootstrap a new Ralph Loop project from this template.
#
# Usage:
#   ./init.sh <destination-path> [<project-name>] [<short-description>]
#
# Behavior:
#   1. Copies _project/ to the destination path.
#   2. Substitutes {{PROJECT_NAME}} and {{DESCRIPTION}} in all .md / .sh files.
#   3. Makes ralph.sh executable.
#   4. Runs `git init -b main` and stages the initial files.
#
# Notes:
#   - Refuses to overwrite an existing non-empty destination.
#   - Does not create the initial commit; the human reviews first, then
#     commits when ready.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <destination-path> [<project-name>] [<short-description>]" >&2
  exit 1
fi

DEST="$1"
PROJECT_NAME="${2:-$(basename "$DEST")}"
DESCRIPTION="${3:-A new project bootstrapped from ralph-loop-template.}"

# Resolve the directory containing this script so we can locate _project/.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/_project"

if [[ ! -d "$SOURCE" ]]; then
  echo "error: $SOURCE not found; run this script from inside the template repo." >&2
  exit 1
fi

if [[ -e "$DEST" ]] && [[ -n "$(ls -A "$DEST" 2>/dev/null || true)" ]]; then
  echo "error: $DEST already exists and is not empty." >&2
  exit 1
fi

mkdir -p "$DEST"
cp -r "$SOURCE"/. "$DEST"/

# Substitute placeholders. macOS sed needs '' after -i; on Linux it does
# not. Detect and act accordingly.
sed_inplace() {
  if sed --version >/dev/null 2>&1; then
    sed -i "$@"
  else
    sed -i '' "$@"
  fi
}

while IFS= read -r -d '' file; do
  sed_inplace \
    -e "s/{{PROJECT_NAME}}/${PROJECT_NAME//\//\\/}/g" \
    -e "s|{{DESCRIPTION}}|${DESCRIPTION//|/\\|}|g" \
    "$file"
done < <(find "$DEST" -type f \( -name '*.md' -o -name '*.sh' \) -print0)

chmod +x "$DEST/ralph.sh"

(
  cd "$DEST"
  git init -b main >/dev/null
  git add .
)

cat <<EOF
Initialized $PROJECT_NAME at $DEST

Next steps:
  cd $DEST
  # 1. Open PRD.md, README.md, SPEC.md, CONVENTIONS.md with your
  #    conversational LLM and fill in the substantive sections.
  # 2. Review the staged files and create the initial commit when ready.
  # 3. Run ./ralph.sh 1 for a first single-task validation run.
EOF
