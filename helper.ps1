# ==========================================
# MkDocs Helper Script for Windows
# ==========================================
# Quick reference commands for developing this MkDocs site on Windows
# See mkdocs_setup.md for detailed setup instructions

# Check Python installation
python --version
python -m pip --version

# Install/Update dependencies
python -m pip install -r requirements.txt
python -m pip install --upgrade pip

# List installed packages
python -m pip list

# Check MkDocs version
python -m mkdocs --version

# Start local development server
python -m mkdocs serve

python -m mkdocs serve --watch-theme --dirty

# Access the site at:
# http://127.0.0.1:8000/anjikeesari/

# Build static site (generates site/ directory)
python -m mkdocs build

# Deploy to GitHub Pages
python -m mkdocs gh-deploy --force

# ==========================================
# Troubleshooting
# ==========================================

# If port 8000 is already in use:
# OSError: [Errno 48] Address already in use

# Find and kill the process using port 8000
Get-Process -Id (Get-NetTCPConnection -LocalPort 8000).OwningProcess | Stop-Process -Force

# Or find the specific process ID
Get-NetTCPConnection -LocalPort 8000 | Select-Object OwningProcess
# Then kill it
Stop-Process -Id <PID> -Force

# ==========================================
# Common Issues
# ==========================================

# If 'mkdocs' command not found:
# Use: python -m mkdocs <command>

# If 'pip' command not found:
# Use: python -m pip <command>

# Python Scripts not in PATH?
# Always use 'python -m' prefix for pip and mkdocs commands

# ==========================================
# References
# ==========================================
# - https://www.mkdocs.org/
# - https://squidfunk.github.io/mkdocs-material/
# - Setup Guide: mkdocs_setup.md