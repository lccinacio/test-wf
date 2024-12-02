git fetch --tags
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "Last tag found: $LAST_TAG"

VERSION=$(echo $APP_VERSION | ^v(.*)\.0$)
echo $APP_VERSION
