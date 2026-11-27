# Circuit_lab — 浙江大学「电路与模拟电子技术实验」LaTeX 报告工作区

本工作区为「电路与模拟电子技术实验」课程提供一套完整的 LaTeX 实验报告模板与数据处理环境，参考同课程体系的物理实验（Phy_lab）模板结构制作。

## 目录结构

```
Circuit_lab/
├── Prompt.md            # AI 助手提示词（含数据处理准则与大物实验的差异说明）
├── Courseware/          # 课程教材、原理图、电路截图
├── References/          # 优秀实验报告参考实例
├── data/
│   └── 数据处理准则.md   # 本课程《实验中的误差及数据处理》准则（硬性规范）
├── src/                 # 数据处理 Python 环境与代码
│   ├── README.md         #   环境 eleclab 说明与常用代码片段
│   └── environment.yml   #   conda 环境定义
├── Template/            # LaTeX 模板
│   ├── 模板.tex          #   实验报告模板（复制后填写，七章框架）
│   ├── reference.bib     #   参考文献库
│   ├── resource/         #   报告抬头、电路图、读数照片等图片素材
│   └── python/           #   绘图脚本与生成的曲线图
└── .agent/workflows/
    └── run-python.md    # AI 运行 Python 脚本的工作流
```

## 快速开始

1. 复制模板：`cp Template/模板.tex 我的实验报告.tex`
2. 用 XeLaTeX 编译：`xelatex 我的实验报告.tex`（含参考文献时按 XeLaTeX → BibTeX → XeLaTeX → XeLaTeX 编译）
3. 模板内已包含图、表、公式的占位示例与文末注释模板，参照填写即可

详细说明见：
- [data/数据处理准则.md](data/数据处理准则.md) —— 数据处理与不确定度评定规范
- [src/README.md](src/README.md) —— 数据处理 Python 环境与代码
- [Prompt.md](Prompt.md) —— AI 助手撰写报告的工作流与约束