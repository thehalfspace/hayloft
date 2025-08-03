# Python Project Justfile with uv 🐍📦

# Default target
default: run

# Initialize uv project (creates pyproject.toml)
init:
    uv init
    @echo "🌱 Initialized Python project with uv"

# Create uv-managed virtual environment
venv:
    uv venv
    @echo "🐓 uv virtual environment created"

# Run Python script using uv venv
run:
    uv pip run python main.py

# Run tests using pytest
# (pytest must be declared in pyproject.toml)
test:
    uv pip run pytest tests/

# Format code using black
format:
    uv pip run black .

# Lint code using flake8
lint:
    uv pip run flake8 .

# Clean cache files (__pycache__, .pyc)
clean:
    find . -type d -name '__pycache__' -exec rm -r {} +
    find . -type f -name '*.pyc' -delete
    @echo "🧹 Cleaned up Python cache files"

# Reset environment (delete uv venv)
reset:
    rm -rf .venv
    just venv

