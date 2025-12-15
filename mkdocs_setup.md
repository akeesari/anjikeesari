
# Installation

## Prerequisites

- **Mac**: Homebrew - Install from https://brew.sh/
- **Windows**: Chocolatey - Install from https://chocolatey.org/install
  - **Important**: Run PowerShell or CMD as **Administrator** for Chocolatey operations

## Install Python (includes pip)

This installs Python and pip. After install, restart your terminal then validate.

### Option 1: Using Package Managers

**Windows Users**: Must run PowerShell as Administrator for Chocolatey commands

```sh
# Windows (Run PowerShell as Administrator)
choco install python -y
# Restart terminal after installation
# Validate
python --version
pip --version

# Mac
brew install python
# Validate
python3 --version
pip3 --version
```

### Option 2: Direct Python Installation (Recommended for Windows)

If Chocolatey has issues or you prefer a direct installation:

```sh
# Windows
# 1. Download Python from https://www.python.org/downloads/
# 2. Run the installer
# 3. ✅ IMPORTANT: Check "Add Python to PATH" during installation
# 4. Restart terminal after installation
# 5. Validate
python --version
python -m pip --version
```

### Upgrade Commands

```sh
# Upgrade commands
# Windows (Run PowerShell as Administrator)
choco upgrade python -y
# After upgrading Python, upgrade pip using:
python -m pip install --upgrade pip

# Mac
brew upgrade python
python3 -m pip install --upgrade pip
```
## Install MkDocs and Dependencies

```sh
# Windows - Install all required packages from requirements.txt
python -m pip install -r requirements.txt

# macOS - Install all required packages from requirements.txt
pip3 install -r requirements.txt

# Validate installation
# Windows
python -m mkdocs --version

# macOS
mkdocs --version
```

**Note**: The `requirements.txt` file includes all necessary dependencies:
- mkdocs-material
- mkdocs-glightbox
- mkdocs-pdf-export-plugin
- mkpdfs-mkdocs

**Windows Users**: If `pip` or `mkdocs` commands don't work directly, use `python -m pip` and `python -m mkdocs` instead.

## Setup Existing Project

Clone the repository

```sh
git clone https://github.com/akeesari/anjikeesari.git
```

Navigate to the project directory

```sh
cd anjikeesari
```

**Note**: This is an existing MkDocs project. Do not run `mkdocs new .` as it will overwrite existing content.

## Create a New MkDocs Project (Optional)

Only if you're starting a brand new project from scratch:

```sh
mkdocs new my-project-name
cd my-project-name
```

## Start the MkDocs Server Locally

```sh
# Windows
python -m mkdocs serve

# macOS
mkdocs serve
```
Open your browser and go to:

http://127.0.0.1:8000/anjikeesari/

You should see the MkDocs site!

## Troubleshooting

### Port 8000 Already in Use

If you encounter `OSError: [Errno 48] Address already in use`, the port is already occupied:

```sh
# macOS/Linux - Find process using port 8000
sudo lsof -i :8000

# Kill the process (replace <PID> with actual process ID)
kill -9 <PID>

# Then restart mkdocs serve
mkdocs serve
```

```powershell
# Windows PowerShell - Find and kill process
Get-Process -Id (Get-NetTCPConnection -LocalPort 8000).OwningProcess | Stop-Process -Force

# Then restart mkdocs serve
python -m mkdocs serve
```

### Python/pip Command Not Found

- **Windows**: Use `python` and `python -m pip` (if `pip` command doesn't work)
- **macOS**: Use `python3` and `pip3`
- Restart your terminal after installing Python
- **Windows**: If commands still don't work, Python may not be in your PATH. Either:
  - Reinstall Python and check "Add Python to PATH"
  - Or always use `python -m pip` and `python -m mkdocs`

### mkdocs Command Not Working on Windows

If you get "mkdocs: The term 'mkdocs' is not recognized":

```powershell
# Use python -m mkdocs instead
python -m mkdocs serve
python -m mkdocs build
python -m mkdocs --version
```

This happens when Python Scripts folder is not in your PATH.


For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## References
- https://www.mkdocs.org/#installation
- https://suedbroecker.net/2021/01/25/how-to-install-mkdocs-on-mac-and-setup-the-integration-to-github-pages/