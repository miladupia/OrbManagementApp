#!/bin/bash

# مسیر ذخیره پروژه را تعیین کنید
PROJECT_DIR="orb_management_project"
GITHUB_REPO_URL="https://github.com/YourUsername/OrbManagementApp.git"  # لینک پروژه GitHub شما

# نصب Docker و Git در صورت عدم وجود
echo "Checking for Docker and Git..."
if ! [ -x "$(command -v docker)" ]; then
  echo 'Docker is not installed. Installing Docker...'
  sudo apt update
  sudo apt install -y docker.io
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'Git is not installed. Installing Git...'
  sudo apt update
  sudo apt install -y git
fi

# کلون کردن پروژه از GitHub
echo "Cloning the project from GitHub..."
git clone "$GITHUB_REPO_URL" "$PROJECT_DIR"
cd "$PROJECT_DIR"

# ساخت و اجرای کانتینرهای Docker
echo "Building and running Docker containers..."
docker-compose up --build -d

echo "Project setup is complete. The app is now running on http://localhost:3000"
