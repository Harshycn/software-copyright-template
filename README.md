# Typst 软件著作权用户手册模板

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Typst](https://img.shields.io/badge/built%20with-Typst-blue)](https://typst.app/)

一个专为软件著作权申请设计的 **Typst 用户手册模板**，提供开箱即用的样式、布局和结构，帮助开发者快速生成符合申请要求的高质量 PDF 文档。

## ✨ 特性

- 🎨 专业的文档样式和排版
- 📋 符合软著申请规范的内容结构  
- 🔧 模块化组件设计（卡片、截图占位符等）
- 🌍 支持中文字体渲染
- 📱 响应式图片和截图处理
- ⚡ 快速编译和生成

## 📁 文件结构

```
.
├── template.typ         # 核心模板文件（样式、组件定义）
├── main-template.typ    # 主文档模板（复制此文件开始编写）
└── README.md            # 项目说明
```

## 🚀 快速开始

### 1. 安装 Typst

访问 [Typst 官网](https://typst.app/) 或使用包管理器安装：

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

### 2. 创建您的文档

```bash
# 复制模板文件开始编写
cp main-template.typ my-manual.typ
```

### 3. 编辑配置信息

打开文件，修改顶部的配置：

```typst
#let config = (
  software-name: "您的软件名称",
  software-short-name: "简称",
  version: "V1.0",
  author: "开发团队",
  date: "2025年12月",
)
```

### 4. 编写内容

按照模板中的结构填写各章节：
- 软件简介和背景
- 功能模块说明
- 使用方法和步骤
- 功能截图
- 常见问题

### 5. 编译生成 PDF

```bash
typst compile my-manual.typ my-manual.pdf
```


## 📝 常用组件

### 功能卡片
```typst
#feature-card("标题", "内容描述")
```

### 提示框（支持多种样式）
```typst
#tip-box("信息内容", type: "info")       // 蓝色
#tip-box("警告内容", type: "warning")    // 黄色
#tip-box("错误内容", type: "danger")     // 红色
#tip-box("成功内容", type: "success")    // 绿色
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
#screenshot-placeholder("在此处插入截图")  // 截图占位符
按下 #kbd("Ctrl") + #kbd("S") 保存         // 键盘快捷键
#code-block("print('hello')", lang: "python")  // 代码块
#badge("标签", color: colors.success)      // 徽章
#divider()                                  // 分隔线
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
│   ├── 3.1 模块A说明
│   ├── 3.2 模块B说明
│   └── ... （包含功能描述、截图等）
├── 第4章 核心算法（可选）
└── 第5章 常见问题
```

### 软著申请建议

- ✅ **页数要求**：建议 30-60 页
- ✅ **功能覆盖**：涵盖主要功能模块
- ✅ **截图清晰**：每个功能配置相应截图
- ✅ **逻辑完整**：功能描述 → 处理流程 → 截图演示
- ✅ **文档规范**：格式整齐、排版专业

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

// 修改字体（默认支持中文）
#set text(
  font: ("Source Han Sans SC", "SimHei", "Microsoft YaHei"),
  size: 11pt,
)

// 修改页面边距
#set page(margin: (x: 2.5cm, y: 2.5cm))
```

## 📚 参考资源

- [Typst 官方文档](https://typst.app/docs/)
- [Typst 中文文档](https://typst-doc-cn.github.io/docs/)
- [Typst 模板库](https://typst.app/universe)

## 💡 提示

- 复制 `main-template.typ` 开始编写你的文档
- 生成的 PDF 文件已在 `.gitignore` 中忽略

## 📜 许可证

MIT License - 自由使用和修改

## 🤝 反馈

有问题或建议？欢迎提交 Issue 或 Pull Request！
