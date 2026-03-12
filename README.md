# rag-eval-pipeline

Day 0 - 11MAR Notes:
uv is an extremely fast Python package manager and virtual environment creator. Think of it as a modern, high-performance upgrade to the standard pip and virtualenv tools.

Benefits:
Speed: It resolves and installs dependencies 10 to 100 times faster than standard pip. When you have a massive list of heavy AI libraries (like LangChain, OpenAI, ChromaDB, etc.), standard pip can take minutes to figure out the right versions. uv does it in seconds.
Environment Management (uv venv): This command instantly creates an isolated "sandbox" (a virtual environment) for your project. This ensures the packages you install for this RAG pipeline don't conflict with other Python projects on your computer.
Dependency Installation (uv pip install -e ".[dev]"): This tells uv to look at the pyproject.toml file just made, figure out the perfect compatibility matrix for all those libraries, and install them into your new virtual environment.

Security Baseline:
To ensure no accidental leak an API key to GitHub (which the detect-secrets hook is actively watching for), need to create an .env.example file. This file will serve as a template for anyone cloning your repo, showing them what variables they need without exposing the actual keys.