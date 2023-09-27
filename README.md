# Build

- `docker build -t nnnpooh/iedoc:latest .`
- `docker build -t iecmu/iedoc:latest .`

# Test

- `docker run -d --name doc-main -p 3001:80 nnnpooh/iedoc`

# Run

- `docker push nnnpooh/iedoc`
- `docker push iecmu/iedoc`
