git fetch --tags
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "Last tag found: $LAST_TAG"

VERSION_REGEX="v([0-9]+)\.([0-9]+)\.([0-9]+)"
if [[ $LAST_TAG =~ $VERSION_REGEX ]]; then
    MAJOR="${BASH_REMATCH[1]}"
    MINOR="${BASH_REMATCH[2]}"
    PATCH="${BASH_REMATCH[3]}"
else
    echo "Invalid tag format! Make sure the tag format is 'v<major>.<minor>.<patch>'."
    exit 1
fi
  
NEW_MINOR=$((MINOR + 1))
NAME="teste/${MAJOR}.${NEW_MINOR}.${PATCH}"
BRANCH_NAME=$(echo $NAME | sed 's/..$/.x/')
echo $BRANCH_NAME
