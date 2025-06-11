# GitHub Pages 部署故障排除指南

## 🚨 常见错误及解决方案

### 错误1: "Get Pages site failed. Please verify that the repository has Pages enabled"

**原因**: GitHub Pages未正确启用或配置

**解决步骤**:

1. **检查仓库可见性**
   - 确保仓库是 **Public** （GitHub Pages免费版只支持公共仓库）
   - 如果是私有仓库，需要GitHub Pro或更高版本

2. **启用GitHub Pages**
   ```
   Settings → Pages → Source → GitHub Actions
   ```

3. **检查分支名称**
   - 确保推送到正确的分支（main 或 master）
   - 在Actions配置中检查分支名称匹配

### 错误2: "HttpError: Not Found"

**可能原因**:
- 仓库不存在或无访问权限
- Pages功能未启用
- 工作流权限不足

**解决方案**:

1. **检查仓库权限**
   ```
   Settings → Actions → General → Workflow permissions
   选择: "Read and write permissions"
   勾选: "Allow GitHub Actions to create and approve pull requests"
   ```

2. **手动触发部署**
   ```
   Actions → 选择工作流 → Run workflow
   ```

### 错误3: 部署成功但页面显示404

**解决方案**:
1. 检查index.html文件是否在根目录
2. 等待5-10分钟让DNS传播
3. 清除浏览器缓存

## 🔧 手动部署替代方案

如果GitHub Actions持续失败，可以使用手动部署：

### 方法1: gh-pages分支部署

```bash
# 1. 创建gh-pages分支
git checkout --orphan gh-pages

# 2. 删除所有文件
git rm -rf .

# 3. 从main分支复制文件
git checkout main -- index.html dual_currency_yield.html README.md

# 4. 提交并推送
git add .
git commit -m "Deploy to gh-pages"
git push origin gh-pages

# 5. 在Settings → Pages中选择gh-pages分支
```

### 方法2: 使用GitHub CLI

```bash
# 安装GitHub CLI
gh auth login

# 启用Pages
gh api -X POST /repos/:owner/:repo/pages \
  -f source='{"branch":"main","path":"/"}'
```

## 📋 完整检查清单

在部署前，请确保：

- [ ] 仓库是公共的（或有GitHub Pro）
- [ ] 在Settings → Pages中启用了Pages
- [ ] 选择了"GitHub Actions"作为源
- [ ] 在Settings → Actions中配置了正确的权限
- [ ] index.html文件在根目录
- [ ] 工作流文件在.github/workflows/目录
- [ ] 分支名称在配置中正确（main或master）

## 🆘 如果仍然失败

1. **检查GitHub状态页面**: https://www.githubstatus.com/
2. **查看Actions日志**: 仓库 → Actions → 点击失败的运行
3. **尝试重新运行**: Actions → Re-run jobs
4. **联系GitHub支持**: 如果是平台问题

## 🔍 调试命令

```bash
# 检查当前分支
git branch --show-current

# 检查远程仓库URL
git remote -v

# 检查git状态
git status

# 检查最近提交
git log --oneline -5
``` 