# MATLAB 科学计算与数据可视化综合平台（GUIDE）

**版本**：V2.0  
**开发工具**：MATLAB GUIDE  
**开发环境**：MATLAB R2022a  
**开发小组**：组长 韩家薪；组员 王梓乔、王圣尧、陈振冬、杨子涵

---

## 一、项目说明

本工程是 GUIDE 版本，采用：

```text
CalcPlatform.fig
CalcPlatform.m
算法函数 .m
```

- `CalcPlatform.fig`：保存完整界面，包括左侧导航、9 个功能页面、按钮、表格和坐标轴；
- `CalcPlatform.m`：GUIDE 主程序、OpeningFcn、OutputFcn、figure1_CreateFcn 和全部回调；
- 算法函数与界面分离，便于维护。

---

## 二、文件清单

| 文件 | 说明 |
|---|---|
| `CalcPlatform.fig` | GUIDE 界面文件 |
| `CalcPlatform.m` | GUIDE 主程序和回调 |
| `semi_tensor.m` | 第一型矩阵半张量积 |
| `stl_lcm.m` | 左半张量积（备用） |
| `parse_matrix.m` | 矩阵文本解析 |
| `mat2str_pretty.m` | 矩阵格式化输出 |
| `adv_analyze.m` | 矩阵高级分析 |
| `stat_core.m` | 基本统计量 |
| `fit_poly.m` | 多项式拟合 |
| `poly_equation.m` | 多项式方程字符串 |
| `tern.m` | 条件选择辅助函数 |
| `fmt_cplx.m` | 复数格式化 |
| `start.m` | 启动函数 |  


## 三、启动方式
在MATLAB中输入以下命令启动计算器：
```MATLAB
start
```

## 四、创新点
马卡龙计算器中的矩阵运算使用的是比较常用的左半张量积，可以对维数不符合普通矩阵乘法的矩阵进行计算。适合完成有此需要的计算和教学任务。同时，对于符合普通矩阵乘法的矩阵，左半张量积与普通矩阵乘法的结果相同。  

## AI使用说明（作业提交要求，用户可忽略）
整体文件使用guide进行页面的排布并实现回调函数，其中矩阵分析部分后端计算函数使用deepseekv4.1flash模型生成，start.m为启动函数，同样由大模型生成，如果不使用start启动，页面会闪退，原因不明。
其中类似```%#ok<AGROW>```的注释也是由大模型建议添加，否则代码会报警告，不建议删除。