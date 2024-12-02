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

  if git ls-remote --heads origin "$BRANCH_NAME" | grep -q "$BRANCH_NAME"; then
    echo "The branch '$BRANCH_NAME' already exist in remote repository."
    echo "To create the branch with correct ref. delete the current *'$BRANCH_NAME'* and then run workflow again!"
    exit 1
  fi

  echo "New branch name: $BRANCH_NAME"
  git checkout -b "$BRANCH_NAME"
  git push origin "$BRANCH_NAME"
  exit 0