# Web3 投资收益工具集

[![Deploy to GitHub Pages](https://github.com/scdotbox/crypto_values/actions/workflows/static.yml/badge.svg)](https://github.com/scdotbox/crypto_values/actions/workflows/static.yml)

专业的Web3投资分析工具集合，帮助您在加密货币市场中做出明智的投资决策。

## 🌟 功能特色

### 双币赢收益计算器
- **收益与机会成本分析**：精确计算双币投资策略的收益，并与传统持币策略进行对比
- **盈亏平衡价格分析**：计算关键价格阈值，帮助您理解风险边界
- **多策略支持**：支持"高价卖出"和"低价买入"两种投资策略
- **实时计算**：基于用户输入参数进行实时收益计算
- **风险评估**：全面的风险分析和机会成本评估

### AMM 流动性挖矿 (LP) 收益计算器
- **多协议支持**：支持 Uniswap V2/V3、集中流动性等多种 AMM 协议模型
- **无常损失分析**：精确计算无常损失 (Impermanent Loss) 对投资收益的影响
- **手续费收益预估**：基于交易量和 TVL 估算年化手续费收益 (APY)
- **集中流动性策略**：支持 Uniswap V3 等集中流动性协议的价格区间设置
- **风险与收益平衡**：全面分析 LP 投资相比直接持有 (HODL) 的优劣
- **灵活投入方式**：支持均衡投入和单币投入两种流动性添加方式

### 抄底策略生成器 (马丁格尔/金字塔/网格)
- **马丁格尔策略**：经典倍投策略，价格下跌时按倍数递增投入，快速拉低持仓成本
- **金字塔策略**：防御性分批建仓策略，越跌投入越少，有效控制风险
- **网格策略**：区间震荡交易策略，设置买卖网格实现高抛低吸
- **风险评估**：全面分析各策略的风险特征和适用场景
- **精确计算**：详细计算每个价位的投入金额、持仓成本和盈亏平衡点
- **策略对比**：支持多种策略参数调优和效果对比分析

## 🚀 在线体验

访问我们的在线工具：[https://scdotbox.github.io/crypto_values](https://scdotbox.github.io/crypto_values)

## 📱 支持的设备

- 💻 桌面浏览器（Chrome、Firefox、Safari、Edge）
- 📱 移动设备（iOS Safari、Android Chrome）
- 📟 平板设备

## 🛠️ 技术栈

- **前端框架**：原生HTML5、CSS3、JavaScript
- **UI框架**：Tailwind CSS
- **图标库**：Font Awesome
- **字体**：Inter Font Family
- **部署**：GitHub Pages + GitHub Actions

## 📦 本地开发

### 克隆项目
```bash
git clone https://github.com/scdotbox/crypto_values.git
cd crypto_values
```

### 本地预览
由于项目是纯静态页面，您可以：

1. **使用Python内置服务器**：
```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

2. **使用Node.js http-server**：
```bash
npx http-server -p 8000
```

3. **直接在浏览器中打开**：
```bash
open index.html  # macOS
xdg-open index.html  # Linux
start index.html  # Windows
```

访问 `http://localhost:8000` 即可查看项目。

## 🌐 GitHub Pages 部署方案

### 自动部署（推荐）

本项目已配置GitHub Actions自动部署，每次推送到主分支时会自动部署到GitHub Pages。

#### 步骤1：Fork或克隆项目
```bash
git clone https://github.com/scdotbox/crypto_values.git
cd crypto_values
```

#### 步骤2：推送到您的GitHub仓库
```bash
# 添加您的远程仓库
git remote set-url origin https://github.com/YOUR_USERNAME/crypto_values.git

# 推送代码
git push origin main
```

#### 步骤3：启用GitHub Pages
1. 进入您的GitHub仓库设置页面
2. 找到"Pages"部分
3. 在"Source"中选择"GitHub Actions"
4. 保存设置

#### 步骤4：等待部署完成
- GitHub Actions会自动运行部署流程
- 大约1-2分钟后，您的网站将在 `https://YOUR_USERNAME.github.io/crypto_values_local` 可用

### 手动部署

如果您想要手动部署：

#### 步骤1：创建gh-pages分支
```bash
git checkout --orphan gh-pages
git rm -rf .
```

#### 步骤2：复制静态文件
```bash
# 从main分支复制文件
git checkout main -- index.html dual_currency_yield.html README.md
```

#### 步骤3：推送到gh-pages分支
```bash
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages
```

#### 步骤4：配置GitHub Pages
1. 在GitHub仓库设置中找到"Pages"
2. 选择"Deploy from a branch"
3. 选择"gh-pages"分支
4. 选择"/ (root)"文件夹
5. 点击保存

## 📁 项目结构

```
crypto_values_local/
├── index.html                 # 主页面（导航页）
├── dual_currency_yield.html   # 双币赢收益计算器
├── lp_yield.html              # AMM 流动性挖矿收益计算器
├── grid_strategay.html        # 抄底策略生成器 (马丁格尔/金字塔/网格)
├── README.md                  # 项目说明文档
├── deploy.sh                  # 部署脚本
└── .github/
    └── workflows/
        └── static.yml         # GitHub Actions部署配置
```

## 🎯 使用指南

### 双币赢计算器使用步骤

1. **选择投资策略**：
   - 高价卖出：当价格达到目标价时卖出持有的加密货币
   - 低价买入：当价格跌到目标价时买入加密货币

2. **输入参数**：
   - 投入数量：您要投资的金额或数量
   - 目标价格：触发买卖操作的价格
   - 年化收益率：投资产品的APY
   - 投资期限：投资持续的天数
   - 预期结算价格：您预测的到期时市场价格

3. **查看结果**：
   - 结算结果：最终收到的资产类型和数量
   - 总价值：按结算价计算的总价值
   - 对比分析：与其他投资策略的收益对比
   - 盈亏平衡分析：关键价格阈值分析

### LP 收益计算器使用步骤

1. **选择协议模型**：
   - 标准 AMM：Uniswap V2 等传统 AMM 模型
   - 集中流动性：Uniswap V3/V4、MMT、Meteora DLMM 等

2. **设置交易对和流动性**：
   - 输入交易对代币名称（如 SUI/USDC）
   - 选择投入方式：均衡投入或单币投入
   - 设置投入数量

3. **配置价格参数**：
   - 当前价格：市场实时价格
   - 价格范围：集中流动性的价格区间（仅 V3）
   - 预期未来价格：用于计算无常损失

4. **输入收益参数**：
   - 24小时交易量：用于估算手续费收益
   - 池子总流动性 (TVL)
   - 手续费率：协议手续费率
   - 投资天数：预期持有期限

5. **分析结果**：
   - 无常损失计算和百分比
   - 手续费收益预估和 APY
   - 净收益对比 HODL 策略
   - 集中流动性建议价格区间

### 抄底策略生成器使用步骤

1. **选择策略类型**：
   - 马丁格尔策略：适合强趋势反转场景，风险较高
   - 金字塔策略：保守型分批建仓，风险相对较低
   - 网格策略：适合区间震荡行情，追求稳定收益

2. **设置基础参数**：
   - 目标资产：选择要交易的加密货币
   - 起始价格：当前市场价格或预期开始价格
   - 计划总投入：准备用于该策略的总资金

3. **配置策略参数**：
   - **马丁格尔**：设置加仓间距、倍率和总次数
   - **金字塔**：设置首仓占比、加仓间距和买入次数
   - **网格**：设置价格区间、网格数量和单格止盈

4. **查看策略计划**：
   - 每个价位的具体买入计划
   - 累计投入和持仓成本变化
   - 盈亏平衡点和止盈建议
   - 风险提示和策略总结

## 🤝 贡献指南

我们欢迎任何形式的贡献！

### 提交问题
如果您发现bug或有功能建议，请[创建Issue](https://github.com/scdotbox/crypto_values/issues)。

### 提交代码
1. Fork本项目
2. 创建功能分支：`git checkout -b feature/your-feature`
3. 提交更改：`git commit -am 'Add some feature'`
4. 推送分支：`git push origin feature/your-feature`
5. 创建Pull Request

### 开发规范
- 使用语义化的提交消息
- 确保代码符合项目风格
- 添加必要的注释和文档
- 测试您的更改

## 📄 许可证

本项目基于MIT许可证发布。详情请见[LICENSE](LICENSE)文件。

## 🔗 相关链接

- [在线演示](https://scdotbox.github.io/crypto_values)
- [问题反馈](https://github.com/scdotbox/crypto_values/issues)
- [功能请求](https://github.com/scdotbox/crypto_values/issues/new)

## ⚠️ 免责声明

本工具仅供教育和参考目的，不构成投资建议。加密货币投资具有高风险，请在投资前充分了解相关风险并咨询专业投资顾问。

---

<div align="center">
  <p>如果这个项目对您有帮助，请考虑给它一个⭐️</p>
  <p>Made with ❤️ for the Web3 community</p>
</div>
