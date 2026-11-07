@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo === 初始化 tiku-public ===
if not exist ".git" (
  git init -b main
) else (
  echo 已存在 .git，跳过 init
)

rem 没配过 git 身份时给一个默认值，避免 commit 失败
git config user.name >nul 2>&1 || git config user.name "spbbhyg"
git config user.email >nul 2>&1 || git config user.email "spbbhyg@users.noreply.github.com"

git add -A
git commit -m "init: public question bank skeleton" 2>nul

git remote remove origin 2>nul
git remote add origin https://github.com/spbbhyg/tiku-public.git

echo.
echo === 首次推送会弹出 GitHub 登录窗口，登录 spbbhyg 即可 ===
git push -u origin main
if errorlevel 1 (
  echo.
  echo 远端已有内容（建仓时勾了 README），先合并再推...
  git pull --rebase origin main --allow-unrelated-histories
  git push -u origin main
)

echo.
echo 完成。之后在 tiku-studio 设置页点「一键更新题库」即可拉取。
pause
