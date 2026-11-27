# src/ — 电路与模电实验数据处理 Python 环境

本目录用于存放电路与模拟电子技术实验课程中数据处理、绘图、拟合等 Python 脚本。

---

## 🐍 Conda 虚拟环境

- **环境名称**: `eleclab`
- **Python 版本**: `3.10`
- **环境定义文件**: `environment.yml`（位于本目录下）

---

## 📦 所需 Python 模块

以下为电路与模电实验课程数据处理常用的 Python 模块：

| 模块 | 用途 | 安装来源 |
| --- | --- | --- |
| **numpy** | 数值计算、数组运算、统计量计算 | conda |
| **scipy** | 科学计算（曲线拟合 `curve_fit`、插值、积分等） | conda |
| **matplotlib** | 绘图（伏安特性曲线、二极管特性曲线、拟合直线等） | conda |
| **pandas** | 表格数据读写与处理 | conda |
| **pillow** | 图片处理（裁剪原始数据扫描件等） | conda |
| **PyQt6** | matplotlib 的 Qt 后端（交互式绘图窗口） | conda |
| **uncertainties** | 不确定度传递与误差计算 | pip |
| **sympy** | 符号计算（公式推导、不确定度表达式化简） | conda |
| **openpyxl** | 读写 Excel 文件（`.xlsx`） | conda |
| **lmfit** | 高级曲线拟合（比 scipy 更灵活的参数约束） | pip |

---

## 🔧 手动环境创建（面向人类用户）

### 方式一：使用 `environment.yml` 一键创建（推荐）

```bash
# 创建环境（首次）
conda env create -f environment.yml

# 更新环境（environment.yml 修改后）
conda env update -f environment.yml --prune
```

### 方式二：手动创建

```bash
# 1. 创建 conda 环境
conda create -n eleclab python=3.10 -y

# 2. 激活环境
conda activate eleclab

# 3. 安装 conda 可用的包
conda install numpy scipy matplotlib pandas pillow pyqt sympy openpyxl -y

# 4. 安装 pip 专属的包
pip install uncertainties lmfit
```

### 常用环境管理命令

```bash
conda activate eleclab      # 激活环境
conda deactivate             # 退出环境
conda env remove -n eleclab  # 删除环境（如需重建）
```

---

## 🤖 AI Agent 工作流指引

> **本节面向 Claude / Codex / Gemini 等 AI 编程助手。**
> 当你需要运行 `src/` 目录下的 Python 脚本时，请严格按照以下流程操作。

### 步骤 0：先确认用户要用的虚拟环境/解释器（必须）

在执行任何 `python` 之前，先向用户确认使用哪一种方式运行脚本：

- **推荐**：使用本项目的 conda 环境 `eleclab`
- **可选**：使用用户已有的 conda 环境（给出环境名，例如 `myenv`）
- **可选**：使用用户已有的 venv/解释器路径（给出 `python` 的绝对路径）

确认后，用一个变量统一表示「Python 运行命令」：

```bash
# 例 1：项目推荐 conda 环境（推荐）
PYTHON_RUN='conda run -n eleclab python'

# 例 2：用户自定义 conda 环境
# PYTHON_RUN='conda run -n <ENV_NAME> python'

# 例 3：用户自定义 venv/解释器路径
# PYTHON_RUN='<ABSOLUTE_PATH_TO_PYTHON>'
```

> 若用户不确定或未提供信息：默认先询问是否使用 `eleclab`；只有用户明确同意后才继续。

### 总体流程

```
[步骤0] 确认虚拟环境/解释器 → [步骤1] 检测 conda → [步骤2] 检测 eleclab 环境
→ [步骤3] 创建环境并装依赖 → [步骤4] 验证模块 → [步骤5] 运行脚本 → [步骤6] 检查结果
```

### 步骤 1：检测宿主机 conda 是否可用

```bash
conda --version
```

- 成功（输出版本号）→ 继续步骤 2。
- 失败（command not found）→ 报告并停止，提供 Miniconda 安装链接：`https://docs.conda.io/en/latest/miniconda.html`。

### 步骤 2：检测 eleclab 环境是否存在

```bash
conda env list | grep "eleclab"
```

- 已存在 → 确认是否直接使用；用户要求重建则 `conda env remove -n eleclab -y` 后进入步骤 3。
- 不存在 → 询问是否创建；用户拒绝则停止。

### 步骤 3：创建 eleclab 环境

优先使用 `environment.yml`：

```bash
conda env create -f <本项目 src 目录的绝对路径>/environment.yml
```

备选（无 yml 时）：

```bash
conda create -n eleclab python=3.10 numpy scipy matplotlib pandas pillow pyqt sympy openpyxl -y
```

再安装 pip 包（用 `conda run` 定位 pip，不 `conda activate`）：

```bash
PHYLAB_PIP=$(conda run -n eleclab which pip) && $PHYLAB_PIP install uncertainties lmfit
```

### 步骤 4：验证关键模块可用性

```bash
conda run -n eleclab python -c "
modules = {
    'numpy': 'numpy', 'scipy': 'scipy', 'matplotlib': 'matplotlib',
    'pandas': 'pandas', 'sympy': 'sympy', 'openpyxl': 'openpyxl',
    'uncertainties': 'uncertainties', 'lmfit': 'lmfit', 'PIL': 'pillow',
}
missing = []
for mod, pkg in modules.items():
    try:
        __import__(mod)
    except ImportError:
        missing.append(pkg)
if missing:
    print('MISSING:' + ','.join(missing))
else:
    print('ALL_OK')
"
```

- `ALL_OK` → 步骤 5；`MISSING:xxx,yyy` → 询问后按需安装（conda 优先，pip 兜底）。

### 步骤 5：运行 Python 脚本

```bash
$PYTHON_RUN <脚本的绝对路径>
```

> **⚠️ 不要用 `conda activate`**（非交互式 shell 可能失败），始终用 `conda run -n eleclab <命令>`。

### 步骤 6：检查输出与结果

1. 退出码 0 = 成功；非零 = 分析 stderr。
2. 生成了图片文件 → 告知保存路径并询问是否引用进 LaTeX 报告。
3. 出错 → 展示原因与修复建议，询问是否帮忙修复。

---

## ⚠️ Agent 注意事项

1. 非交互式环境勿用 `conda activate`，用 `conda run -n eleclab`。
2. 运行脚本、保存文件一律用绝对路径。
3. 中文绘图需配置中文字体：

   ```python
   import matplotlib
   matplotlib.rcParams['font.sans-serif'] = ['SimHei']
   matplotlib.rcParams['axes.unicode_minus'] = False
   ```

4. 图片输出推荐 PDF（矢量图），便于 LaTeX 引用；如为伏安特性/二极管特性等曲线，还可同时保存 PDF + PNG。
5. 安装包、删除环境、创建文件等修改系统状态的操作前必须先向用户确认。
6. 模块安装优先级：conda 优先，pip 兜底。

---

## 📂 推荐目录结构

```
src/
├── README.md              # 本说明文件
├── environment.yml        # conda 环境定义文件
├── 实验名称/              # 每个实验一个子目录
│   ├── data/              # 原始数据（csv / xlsx）
│   ├── figures/           # 生成的图片（供 LaTeX 引用）
│   └── process.py         # 数据处理脚本
└── utils/                 # 公共工具函数（可选）
    ├── __init__.py
    ├── uncertainty.py     # 不确定度计算工具
    └── plotting.py        # 绘图样式配置
```

---

## 💡 常用代码片段

### 1. 伏安法测电阻数据处理与线性拟合

```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
matplotlib.rcParams['font.sans-serif'] = ['SimHei']
matplotlib.rcParams['axes.unicode_minus'] = False

U = np.array([1.0, 2.0, 3.0, 4.0, 5.0])        # V
I = np.array([10.2, 20.1, 30.0, 40.3, 50.1])   # mA

coeffs = np.polyfit(I, U, 1)   # U = R*I + b
I_fit = np.linspace(I.min(), I.max(), 50)
U_fit = np.polyval(coeffs, I_fit)
R = coeffs[0] * 1000           # 斜率 ×1000 → 欧姆（I 单位 mA）

plt.figure(figsize=(8, 5))
plt.scatter(I, U, color='red', label='实验数据', zorder=5)
plt.plot(I_fit, U_fit, 'b--', label=f'拟合: U = {coeffs[0]:.4f}·I + {coeffs[1]:.4f}')
plt.xlabel('$I$ / mA')
plt.ylabel('$U$ / V')
plt.title('待测电阻伏安特性曲线')
plt.legend(); plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig('figures/UI_curve.pdf', dpi=300)
print(f"R = {R:.2f} Ω")
```

### 2. 不确定度计算（B 类 + 合成）

```python
import numpy as np

x = np.array([1.98, 2.01, 2.00, 1.99, 2.02, 2.00])   # 多次测量值
n = len(x)
xbar = x.mean()
s = x.std(ddof=1)            # 贝塞尔公式：单次测量标准差
uA = s / np.sqrt(n)          # A 类：平均值标准差

a = 0.5                      # 仪表准确度等级 a%
xm = 3.0                     # 量程
Delta = a/100 * xm           # 仪器误差限
uB = Delta / np.sqrt(3)      # B 类（均匀分布）

uc = np.sqrt(uA**2 + uB**2)  # 合成标准不确定度
print(f"xbar={xbar:.4f}, uA={uA:.4f}, uB={uB:.4f}, uc={uc:.4f}")
```

### 3. 二极管特性曲线非线性拟合（指数模型）

```python
from scipy.optimize import curve_fit
import numpy as np

def diode(U, Is, n):
    """指数模型 I = Is*(exp(U/(n*Vt)) - 1)"""
    Vt = 0.026
    return Is * (np.exp(U/(n*Vt)) - 1)

U = np.array([0.50, 0.60, 0.65, 0.70, 0.75])
I = np.array([0.01, 0.30, 1.80, 8.10, 32.50]) * 1e-3

popt, pcov = curve_fit(diode, U, I, p0=[1e-9, 1.5])
perr = np.sqrt(np.diag(pcov))
print(f"Is = {popt[0]:.3e} ± {perr[0]:.3e}")
print(f"n  = {popt[1]:.4f} ± {perr[1]:.4f}")
```