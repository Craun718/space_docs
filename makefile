UV ?= uv

.PHONY: build server sync lock update export

build:
	$(UV) run mkdocs build

server:
	$(UV) run mkdocs serve

# Install project dependencies into .venv.
sync:
	$(UV) sync

# Update uv.lock without installing dependencies.
lock:
	$(UV) lock

# Upgrade dependencies within the constraints in pyproject.toml.
update:
	$(UV) sync --upgrade

# Export locked dependencies for tools that require requirements.txt.
export:
	$(UV) export --format requirements.txt --no-hashes --output-file requirements.txt
