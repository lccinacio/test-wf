git fetch --tags
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=0))
echo "Last tag found: $LAST_TAG"

