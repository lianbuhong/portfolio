# 浙江大学通识课程论文模板（基于 zjuthesis 精简）

适用于通识课程大论文，已删除毕业论文所需的承诺书、任务书、考核表、致谢、作者简历、英文摘要、开题报告，以及研究生/英文模板和各专业格式。

## 文档结构

- `zjuthesis.tex`：主文件，填写课程与作者信息、论文题目
- `page/`
  - `cover.tex`：标题页
  - `toc.tex`：目录
- `body/`
  - `abstract.tex`：中文摘要与关键词
  - `content.tex`：正文各章节汇总
  - `1-introduction.tex`、`2-chapter.tex`、`3-conclusion.tex`：绪论、主体、结论
  - `post.tex`：参考文献
  - `ref.bib`：参考文献条目库
- `figure/`：图片素材（`logo/zju.pdf` 为校徽）
- `config/`、`zjuthesis.cls`：排版核心，一般无需改动

## 使用步骤

1. 在 `zjuthesis.tex` 的 `\documentclass` 选项中填写论文题目、指导教师等信息。
2. 在 `body/abstract.tex` 中替换摘要正文与关键词。
3. 在 `body/` 各章节文件中撰写正文；新增章节时在 `body/content.tex` 中按顺序 `\input`。
4. 在 `body/ref.bib` 中添加文献，正文用 `\cite{key}` 引用。

## 编译

需要 XeLaTeX 引擎。在根目录运行：

```
latexmk
```

PDF 输出到 `out/` 目录。VS Code 中可使用 LaTeX Workshop 插件直接编译。
