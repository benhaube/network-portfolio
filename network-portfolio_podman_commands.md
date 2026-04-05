# Test site command:
`podman run --rm -it -p 8000:8000 -v ${PWD}:/docs:Z mkdocs-obsidian`

# Serve site command:
`podman run --rm -it -p 8000:8000 -v ${PWD}:/docs:Z mkdocs-obsidian serve -a 0.0.0.0:8000`

# Bild site command:
`podman run --rm -it -v ${PWD}:/docs:Z mkdocs-obsidian build`
