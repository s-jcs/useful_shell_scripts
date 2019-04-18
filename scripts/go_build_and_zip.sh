GOARCH=amd64 GOOS=linux go build
name="$(basename "$PWD")"
zip ${name}.zip ${name}
