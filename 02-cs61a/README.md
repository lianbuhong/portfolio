# CS61A：计算机程序的结构与解释

自学完成 UC Berkeley 经典课程 CS61A（The Structure and Interpretation of Computer Programs，Python 版），包括 8 次作业、10 个实验和 4 个课程项目，必做部分的本地测试全部通过。

## 学习内容

- 函数与高阶函数、lambda、递归与树递归
- 数据抽象、序列、可变数据、面向对象编程
- 链表与树、迭代器与生成器
- Scheme 语言及其解释器实现、SQL 基础

## 四个课程项目

| 项目 | 内容 | 涉及知识点 |
|---|---|---|
| `projects/hog` | 骰子游戏的策略模拟与对战 | 模拟、高阶函数、策略算法 |
| `projects/cats` | 自动打字纠错程序 | 字符串处理、递归、记忆化 |
| `projects/ants` | 塔防游戏（含图形界面） | 面向对象、类继承、GUI 协作 |
| `projects/scheme` | 用 Python 实现 Scheme 解释器 | 词法分析、求值模型、递归表达式 |

## 目录结构

```
02-cs61a/
├── hw/        # hw01–hw08，每次作业含解答与 tests
├── lab/       # lab00–lab09，课程配套实验
└── projects/  # hog / cats / ants / scheme 四个项目
```

## 说明

为保持仓库精简，课程自带的 `ok` 测试二进制、第三方依赖库、音效与在线编辑器资源未纳入仓库；各目录下的 `tests/` 与解答源码均完整保留。
