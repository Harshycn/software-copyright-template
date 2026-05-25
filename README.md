# Typst 软件著作权用户手册模板

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Typst](https://img.shields.io/badge/built%20with-Typst-blue)](https://typst.app/)

一个专为软件著作权申请设计的 **Typst 用户手册模板**，提供开箱即用的样式、布局和组件，帮助开发者快速生成结构完整、排版清晰的 PDF 文档。

本模板已经通过软著审核材料验证，可作为软著用户手册的编排基础。

## ✨ 特性

- 🎨 专业的文档样式和排版
- 📋 符合软著申请习惯的内容结构
- 🔧 模块化组件设计（卡片、提示框、截图占位符等）
- 🌍 支持中文字体渲染
- 📱 支持功能截图插入和占位
- 🧠 提供面向 Agent 的源码生成提示词
- ⚡ 快速编译和生成

## 📁 文件结构

```
.
├── template.typ         # 核心模板文件（样式、组件定义）
├── main-template.typ    # 主文档模板（复制此文件开始编写）
├── example.typ          # 组件使用示例
├── PROMPT.md            # Agent 生成用户手册的提示词
├── LICENSE              # 开源许可证
└── README.md            # 项目说明
```

## 🚀 快速开始

### 1. 准备 Typst

使用包管理器安装 Typst：

```bash
# Windows (Scoop)
scoop install typst

# Windows (Winget)
winget install --id Typst.Typst

# macOS (Homebrew)
brew install typst

# Linux (Cargo)
cargo install typst-cli
```

### 2. 选择使用方式

#### 方式一：手动填写模板

适合已有文档内容，或者想自己逐章编写的情况。

```bash
cp main-template.typ manual.typ
```

打开 `manual.typ`，修改顶部配置：

```typst
#let config = (
  software-name: "您的软件名称",
  software-short-name: "简称",
  version: "V1.0",
  doc-title: "用户手册",
  author: "开发团队",
  date: "2026年5月",
)
```

按照模板结构填写：

- 软件简介和背景
- 功能模块说明
- 使用方法和步骤
- 功能截图
- 常见问题

然后编译生成 PDF：

```bash
typst compile manual.typ manual.pdf
```

#### 方式二：让 Agent 从源码生成

适合已有软件源码，希望先生成一版可落地初稿的情况。让 Agent 参考 [PROMPT.md](PROMPT.md) 完成：

1. 提供软件名称、版本、开发团队、源码目录和运行方式。
2. 让 Agent 阅读源码，提取页面、功能模块、接口、数据模型和运行环境。
3. Agent 生成 `manual.typ`，缺少截图的位置先写带编号的占位符：

```typst
#screenshot-placeholder("[SHOT: 01-login] 请提供登录页面截图")
```

4. 用户运行软件，按编号截图并保存到 `screenshots/` 目录，例如：

```text
screenshots/01-login.png
screenshots/02-dashboard.png
screenshots/03-user-management.png
```

5. 将截图交给 Agent，让 Agent 按编号把占位符替换为真实截图：

```typst
#figure(
  image("screenshots/01-login.png", width: 100%),
  caption: [登录页面]
)
```

6. 再次编译并检查 PDF。

可以直接对 Agent 说：

```text
请阅读当前软件源码，参考 PROMPT.md 和 template.typ，生成可编译的 manual.typ。没有截图的位置先写带编号的 screenshot-placeholder；我提供 screenshots/ 目录后，你再按编号替换为 figure(image(...))。
```

## 📝 常用组件

### 功能卡片

```typst
#feature-card("标题", "内容描述")
```

### 提示框

```typst
#tip-box("信息内容", type: "info")
#tip-box("警告内容", type: "warning")
#tip-box("错误内容", type: "danger")
#tip-box("成功内容", type: "success")
```

### 步骤列表

```typst
#step-list(
  "第一步说明",
  "第二步说明",
  "第三步说明",
)
```

### 信息表格

```typst
#info-table(
  [项目], [描述],
  [名称], [内容],
  [版本], [V1.0],
)
```

### 其他组件

```typst
#screenshot-placeholder("在此处插入截图")       // 截图占位符
按下 #kbd("Ctrl") + #kbd("S") 保存           // 键盘快捷键
#code-block("print('hello')", lang: "python") // 代码块
#badge("标签", color: colors.success)        // 徽章
#divider()                                    // 分隔线
```

## 📄 软著文档规范

### 推荐结构

```
├── 封面（自动生成）
├── 目录（自动生成）
├── 第1章 简介
│   ├── 1.1 编写目的
│   ├── 1.2 系统背景
│   └── 1.3 项目概述
├── 第2章 软件概述
│   ├── 2.1 功能模块
│   ├── 2.2 应用范围
│   └── 2.3 技术特点
├── 第3章 使用说明
│   ├── 3.1 功能描述
│   ├── 3.2 处理逻辑
│   └── 3.3 页面截图
├── 第4章 核心算法或核心功能逻辑（可选）
└── 第5章 常见问题
```

### 软著申请建议

- ✅ **页数要求**：建议 30-60 页，最终以申请材料要求为准
- ✅ **功能覆盖**：涵盖主要功能模块
- ✅ **截图清晰**：每个核心功能配置相应截图
- ✅ **逻辑完整**：功能描述 → 处理逻辑 → 截图演示
- ✅ **内容准确**：不要编造源码中不存在的功能

## 🎨 自定义样式

编辑 [template.typ](template.typ) 中的配置部分：

```typst
// 修改颜色主题
#let colors = (
  primary: rgb("#1890ff"),    // 主色调
  success: rgb("#52c41a"),    // 成功
  warning: rgb("#faad14"),    // 警告
  danger: rgb("#ff4d4f"),     // 危险
)

// 修改正文中文字体
#set text(
  font: ("Source Han Sans SC", "SimHei", "Microsoft YaHei"),
  size: 11pt,
)

// 修改代码块字体
#let code-fonts = (
  "Sarasa Mono SC",
  "Source Han Mono SC",
  "Noto Sans Mono CJK SC",
  "Consolas",
  "Source Code Pro",
  "Courier New",
  "Microsoft YaHei",
)

// 修改页面边距
#set page(margin: (x: 2.5cm, y: 2.5cm))
```

## 📜 许可证

MIT License - 自由使用和修改

## 🤝 反馈

有问题或建议？欢迎提交 Issue 或 Pull Request！
