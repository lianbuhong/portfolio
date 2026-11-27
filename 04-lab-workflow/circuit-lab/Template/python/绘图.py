import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['SimHei']   # 使用黑体显示中文
plt.rcParams['axes.unicode_minus'] = False     # 正常显示负号

# 参数
U = 1.0    # 输入电压 (V)
R = 1e4    # 电阻 10kΩ
C = 1e-8   # 电容 0.01uF

# 频率范围 (10Hz 到 1MHz)
f = np.linspace(10, 1_000_000, 1000)

# 公式: UR = (U*R)/(R + 1/(2πfC))
UR = (U * R) / (R + 1/(2 * np.pi * f * C))

# 转换成 mV
UR_mV = UR * 1000

# 绘图
plt.figure(figsize=(10, 6))
plt.plot(f, UR_mV, label=r"$U_R(f)$ 数值计算", color="skyblue", linewidth=2)

# 美化
plt.xlabel("频率 (Hz)", fontsize=12)
plt.ylabel("电压 (mV)", fontsize=12)
plt.title("实验公式数值计算曲线", fontsize=14, pad=15)
plt.grid(True, which="both", linestyle="--", alpha=0.6)
plt.ylim(0, 1050)
plt.xlim(0, 1_000_000)
plt.legend(frameon=False, fontsize=12)

# 保存本地，不显示
plt.savefig("UR_vs_f.png", dpi=300, bbox_inches="tight")
plt.close()
