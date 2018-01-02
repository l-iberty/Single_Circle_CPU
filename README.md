# 单周期CPU的设计与实现（MIPS)
## 一、包含的模块
- 指令存储器`InstructMemory`
- 数据存储器`DataMemory`
- 寄存器堆`Register`
- 控制系统`Control`
- 运算部件`ALU`
- 立即数扩展器`Extend`，支持符号扩展和无符号扩展
- 加法器`Adder`
- 左移2位器`Left_2_Shifter`
- 用于J型指令的拼接器`Union`

## 二、支持的指令
### R-Type
- add
- sub
- and
- or
- nor
- slt

### I-Type
- addi
- andi
- ori
- lw
- sw
- beq
- bne

### J-Type
- j

## 三、测试结果
`Instruction`文件中的指令序列测试通过(行为级仿真).

## Misc
- `Instruction2`是为了测试后续添加的`bne`，仿真时先将`Instruction`备份，再将`Instrction2`重命名为`Instruction`.