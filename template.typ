// ============================================================
// 软件著作权用户手册 - 通用模板
// 版本: 1.0
// 用途: 用于生成符合软著申请要求的用户手册PDF文档
// ============================================================

// ======================= 配置区域 =======================
// 请根据您的项目修改以下配置信息

#let config = (
  // 软件基本信息
  software-name: "您的软件名称",           // 软件全称
  software-short-name: "软件简称",         // 软件简称（可选，用于页眉）
  version: "V1.0",                          // 软件版本号
  
  // 文档信息
  doc-title: "用户手册",                    // 文档标题
  author: "开发团队",                       // 作者/开发团队
  date: "2025年12月",                      // 编制日期
  
  // 情感分析阈值（如适用）
  positive-threshold: 0.6,
  negative-threshold: 0.4,
)

// ======================= 颜色配置 =======================
#let colors = (
  primary: rgb("#1890ff"),      // 主色调（蓝色）
  success: rgb("#52c41a"),      // 成功/正面（绿色）
  warning: rgb("#faad14"),      // 警告（黄色）
  danger: rgb("#ff4d4f"),       // 危险/负面（红色）
  neutral: rgb("#4facfe"),      // 中性（浅蓝色）
  text-gray: gray,              // 灰色文字
  border: luma(200),            // 边框颜色
  bg-light: luma(250),          // 浅色背景
)

// ======================= 页面设置 =======================
#let setup-page(doc, config) = {
  set document(
    title: config.software-name + config.doc-title,
    author: config.author,
  )
  
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    header: [
      #set text(9pt, fill: gray)
      #config.software-name #config.version — #config.doc-title
      #h(1fr)
    ],
    footer: context [
      #set text(9pt, fill: gray)
      #h(1fr)
      #counter(page).display()
      #h(1fr)
    ],
  )
  
  set text(
    font: ("Source Han Sans SC", "SimHei", "Microsoft YaHei"),
    size: 11pt,
    lang: "zh",
  )
  
  set heading(numbering: "1.1.1")
  
  set par(
    justify: true,
    leading: 1.2em,
    first-line-indent: 2em,
  )
  
  doc
}

// ======================= 封面页模板 =======================
#let cover-page(config) = {
  page(
    footer: none,
  )[
    #v(3cm)
    #align(center)[
      #text(size: 28pt, weight: "bold")[
        #config.software-name
      ]
      #v(1cm)
      #text(size: 22pt, weight: "bold")[
        #config.doc-title
      ]
      #v(2cm)
      #text(size: 18pt, weight: "bold")[
        版本：#config.version
      ]
      #v(0.5cm)
      #text(size: 14pt)[
        编制日期：#config.date
      ]
    ]
  ]
}

// ======================= 目录页模板 =======================
#let toc-page() = {
  page()[
    #align(center)[
      #text(size: 18pt, weight: "bold")[目 录]
    ]
    #v(1cm)
    #outline(
      title: none,
      indent: 1.5em,
      depth: 3,
    )
  ]
}

// ======================= 功能卡片样式 =======================
#let feature-card(title, content) = {
  rect(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    stroke: 0.5pt + colors.border,
    fill: colors.bg-light,
  )[
    #text(weight: "bold", size: 11pt)[#title]
    #v(6pt)
    #text(size: 10pt)[#content]
  ]
}

// ======================= 截图占位符样式 =======================
#let screenshot-placeholder(caption) = {
  rect(
    width: 100%,
    height: 6cm,
    stroke: 0.5pt + gray,
    inset: 1cm,
  )[
    #align(center + horizon)[
      #text(fill: gray)[#caption]
    ]
  ]
}

// ======================= 信息表格样式 =======================
#let info-table(..rows) = {
  table(
    columns: (auto, 1fr),
    inset: 10pt,
    stroke: 0.5pt + colors.border,
    align: (left, left),
    ..rows
  )
}

// ======================= 提示框样式 =======================
#let tip-box(content, type: "info") = {
  let (bg-color, border-color, icon) = if type == "info" {
    (rgb("#e6f7ff"), colors.primary, "ℹ️")
  } else if type == "warning" {
    (rgb("#fffbe6"), colors.warning, "⚠️")
  } else if type == "danger" {
    (rgb("#fff2f0"), colors.danger, "❗")
  } else if type == "success" {
    (rgb("#f6ffed"), colors.success, "✅")
  } else {
    (colors.bg-light, colors.border, "📌")
  }
  
  rect(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    stroke: (left: 3pt + border-color),
    fill: bg-color,
  )[
    #text(size: 10pt)[#icon #content]
  ]
}

// ======================= 步骤列表样式 =======================
#let step-list(..steps) = {
  let items = steps.pos()
  for (i, step) in items.enumerate() {
    rect(
      width: 100%,
      inset: 10pt,
      radius: 4pt,
      stroke: 0.5pt + colors.border,
      fill: if calc.odd(i + 1) { colors.bg-light } else { white },
    )[
      #text(weight: "bold", fill: colors.primary)[步骤 #(i + 1)：]
      #step
    ]
    v(4pt)
  }
}

// ======================= 键盘快捷键样式 =======================
#let kbd(key) = {
  box(
    inset: (x: 4pt, y: 2pt),
    radius: 2pt,
    stroke: 0.5pt + colors.border,
    fill: colors.bg-light,
  )[#text(size: 9pt, font: "Consolas")[#key]]
}

// ======================= 代码块样式 =======================
#let code-block(code, lang: "text") = {
  rect(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    stroke: 0.5pt + colors.border,
    fill: rgb("#f5f5f5"),
  )[
    #text(size: 9pt, font: ("Consolas", "Source Code Pro", "Courier New"))[
      #raw(code, lang: lang)
    ]
  ]
}

// ======================= 徽章样式 =======================
#let badge(text-content, color: colors.primary) = {
  box(
    inset: (x: 6pt, y: 2pt),
    radius: 10pt,
    fill: color,
  )[#text(size: 9pt, fill: white, weight: "bold")[#text-content]]
}

// ======================= 分隔线 =======================
#let divider() = {
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + colors.border)
  v(0.5em)
}
