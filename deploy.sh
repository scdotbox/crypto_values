#!/bin/bash

# Web3 投资工具 - GitHub Pages 部署脚本
# 使用说明：./deploy.sh

set -e

echo "🚀 开始部署 Web3 投资工具到 GitHub Pages..."

# 检查是否在git仓库中
if [ ! -d ".git" ]; then
    echo "❌ 错误：当前目录不是git仓库"
    echo "请在项目根目录运行此脚本"
    exit 1
fi

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  检测到未提交的更改，正在提交..."
    git add .
    echo "请输入提交信息 (默认: Update for deployment):"
    read -r commit_message
    if [ -z "$commit_message" ]; then
        commit_message="Update for deployment"
    fi
    git commit -m "$commit_message"
fi

# 获取当前分支
current_branch=$(git branch --show-current)
echo "📍 当前分支: $current_branch"

# 推送到远程仓库
echo "📤 推送到远程仓库..."
git push origin "$current_branch"

# 检查GitHub Actions工作流
echo "🔍 检查GitHub Actions状态..."
echo "请访问以下链接查看部署状态："
echo "https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^.]*\).*/\1/')/actions"

echo ""
echo "✅ 部署脚本执行完成！"
echo ""
echo "📋 后续步骤："
echo "1. 等待GitHub Actions完成构建和部署（通常需要1-2分钟）"
echo "2. 访问您的网站："
echo "   https://$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^/]*\)\/\([^.]*\).*/\1.github.io\/\2/')"
echo ""
echo "🔧 如果这是首次部署，请确保："
echo "1. 在GitHub仓库设置中启用Pages"
echo "2. 在Source中选择'GitHub Actions'"
echo ""
echo "📚 更多信息请查看README.md文件" 