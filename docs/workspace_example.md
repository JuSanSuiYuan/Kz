# Kz语言工作区结构示例

本文档展示了Kz语言项目的推荐工作区结构，特别针对三进制计算机优化。

## 项目结构

```
my_kz_project/
├── package.kz              # 工作区根配置文件
├── core/
│   ├── package.kz          # 核心包配置
│   ├── src/
│   │   ├── trinary/
│   │   │   ├── arithmetic.kz  # 三进制算术运算
│   │   │   ├── memory.kz      # 三进制内存管理
│   │   │   └── encoding.kz    # 三进制编码/解码
│   │   ├── types/
│   │   │   ├── basic.kz       # 基本数据类型
│   │   │   ├── collections.kz # 集合类型
│   │   │   └── traits.kz      # 特性定义
│   │   └── lib.kz             # 核心库入口
│   └── tests/
│       ├── trinary_test.kz
│       └── types_test.kz
├── utils/
│   ├── package.kz          # 工具包配置
│   ├── src/
│   │   ├── io.kz            # IO工具
│   │   ├── string.kz        # 字符串处理
│   │   └── debug.kz         # 调试工具
│   └── tests/
│       └── utils_test.kz
├── examples/
│   ├── package.kz          # 示例包配置
│   ├── hello_world.kz       # 基础示例
│   ├── matrix_mult.kz       # 矩阵乘法示例
│   ├── gpu_compute.kz       # GPU计算示例
│   └── memory_management.kz # 内存管理示例
├── benchmarks/
│   ├── trinary_bench.kz     # 三进制性能基准测试
│   └── binary_comparison.kz # 与二进制比较基准测试
└── docs/
    ├── guide.md             # 使用指南
    └── trinary_principles.md # 三进制原理说明
```

## 工作区配置示例

### 根目录 `package.kz`

```toml
[package]
name = "my_kz_project"
version = "0.1.0"
description = "Kz语言工作区示例项目"

[workspace]
members = [
    "core",
    "utils",
    "examples"
]

[workspace.dependencies]
# 工作区级别的共享依赖
math = "^1.2.0"
log = "^0.5.0"
```

### core包 `core/package.kz`

```toml
[package]
name = "core"
version = "0.1.0"
description = "Kz语言核心库"

[dependencies]
# 核心库不需要依赖其他子包

[package.optimization]
trinary_mode = "balanced"
memory_alignment = "trinary"
register_optimization = true
```

### utils包 `utils/package.kz`

```toml
[package]
name = "utils"
version = "0.1.0"
description = "Kz语言工具库"

[dependencies]
core = { path = "../core", link_type = "hard" }
```

### examples包 `examples/package.kz`

```toml
[package]
name = "examples"
version = "0.1.0"
description = "Kz语言示例代码"

[dependencies]
core = { path = "../core", link_type = "hard" }
utils = { path = "../utils", link_type = "hard" }
gpu = { version = "^1.0.0", optional = true }

[dev-dependencies]
test = "^1.0.0"
benchmark = "^0.5.0"
```

## 三进制优化建议

1. **按功能模块组织三进制代码**：将三进制特有的功能集中在`trinary`目录中

2. **硬件抽象层**：在core包中提供统一的硬件访问接口，针对三进制CPU优化

3. **内存布局优化**：利用三进制的信息密度优势，优化数据结构的内存布局

4. **并行计算设计**：设计适合三进制架构的并行计算模式

## 编译工作区

### 编译整个工作区

```bash
# 在根目录执行
kz mod install --workspace
kzc --workspace
```

### 编译单个包

```bash
cd core
kzc --release
```

### 运行特定示例

```bash
cd examples
kzc hello_world.kz -o hello_world -L../core -L../utils
./hello_world
```

## 测试工作区

### 运行所有测试

```bash
# 在根目录执行
kz mod test --workspace
```

### 运行特定测试

```bash
cd core
kz mod test
```

## 注意事项

- 利用`link_type = "hard"`启用硬链接机制，减少磁盘空间占用
- 在`package.kz`中合理配置三进制优化选项
- 为三进制特有功能添加详细的注释和文档
- 使用工作区共享依赖，避免版本冲突

## Python风格语法和多编码支持示例

### 示例代码风格

以下是采用Python风格语法（缩进代替大括号）的Kz代码示例：

```python
# src/trinary/arithmetic.kz 示例
import std.memory

# 三进制加法函数
def 三进制加法(a: Int, b: Int) -> Int:
    # 使用Python风格缩进，无大括号
    let carry = 0
    let result = 0
    let position = 0
    
    while a != 0 or b != 0 or carry != 0:
        let digit_a = a % 3
        let digit_b = b % 3
        
        # 三进制位相加
        let sum_digits = digit_a + digit_b + carry
        
        # 处理进位
        if sum_digits >= 2:
            result += (sum_digits - 3) * pow(3, position)
            carry = 1
        elif sum_digits <= -2:
            result += (sum_digits + 3) * pow(3, position)
            carry = -1
        else:
            result += sum_digits * pow(3, position)
            carry = 0
        
        a = a // 3
        b = b // 3
        position += 1
    
    return result

# 编译期计算示例
@compile_time
def 编译期计算三进制常量() -> Int:
    return 三进制加法(5, 7)  # 5+7=12

const 预计算结果 = 编译期计算三进制常量()
```

### 多编码支持示例

在项目中混合使用不同编码的源文件：

```bash
# 创建UTF-8编码的源文件
kz mod new utf8_example --encoding utf8

# 创建GBK编码的源文件
kz mod new gbk_example --encoding gbk
```

在package.kz中配置编码设置：

```toml
[package.encoding]
default = "utf8"
supported = ["utf8", "gbk", "gb2312", "ascii"]
```

### 三进制优化建议（补充）

5. **语法一致性**：在整个项目中保持Python风格缩进的一致性，使用4空格
6. **命名多样性**：充分利用多编码支持，可以根据模块功能选择中文或英文命名
7. **注释规范**：统一使用`#`进行注释，为三进制特有算法添加详细说明
8. **编译选项**：在kzconfig.toml中配置Python风格语法解析器和多编码支持

这个工作区结构设计充分考虑了三进制计算机的特性，并利用了kz mod的硬链接和workspace功能，可以高效地组织和管理Kz语言项目。采用Python风格语法和多编码支持，使代码更易读且兼容各种开发环境。