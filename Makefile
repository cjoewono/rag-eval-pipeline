.PHONY: setup lint test eval docker-up docker-down clean

setup:
	@echo "Setting up development environment..."
	uv venv
	uv pip install -e ".[dev]"
	pre-commit install
	@echo "Setup complete. Run 'source .venv/bin/activate' to activate the environment."

lint:
	@echo "Running linters and formatters..."
	pre-commit run --all-files

test:
	@echo "Running unit tests..."
	pytest tests/unit -v

eval:
	@echo "Running RAG evaluations..."
	deepeval test run tests/eval

docker-up:
	@echo "Starting local services..."
	docker-compose up -d

docker-down:
	@echo "Stopping local services..."
	docker-compose down

clean:
	@echo "Cleaning up caches and temporary files..."
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".mypy_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
