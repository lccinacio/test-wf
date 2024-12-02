git fetch --tags
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "Last tag found: $LAST_TAG"

VERSION=$(echo $LAST_TAG | sed 's/..$/.x/')
BRANCH_NAME=$(echo $VERSION | sed 's/^.//')


echo $VERSION
echo $BRANCH_NAME
