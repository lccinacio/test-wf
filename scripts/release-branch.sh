git fetch --tags
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "Last tag found: $LAST_TAG"


VERSION_REGEX="v([0-9]+)\.([0-9]+)\.([0-9]+)"
  if [[ $LAST_TAG =~ $VERSION_REGEX ]]; then
    MAJOR="${BASH_REMATCH[1]}"
    echo $MAJOR   
    MINOR="${BASH_REMATCH[2]}"
    echo $MINOR
    PATCH="${BASH_REMATCH[3]}"
  else
    echo "Invalid tag format! Make sure the tag format is 'v<major>.<minor>.<patch>'."
    exit 1
  fi

# VERSION=$(echo $LAST_TAG | sed 's/..$/.x/')
# BRANCH_NAME=$(echo $VERSION | sed 's/^.//')


# echo $VERSION
# echo $BRANCH_NAME
