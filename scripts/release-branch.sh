git fetch --tags
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "Last tag found: $LAST_TAG"

VERSION=$(^v(.*)\.0$)
echo $VERSION
