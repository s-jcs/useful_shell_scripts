git branch --merged | egrep -v "(^\*|main|master|develop)" | xargs git branch -d
