# Kz 编程语言

Kz是一种创新的三进制编程语言，专为三进制计算机设计和优化，充分利用三进制计算的独特优势。

专为三进制计算机设计的高性能编程语言，结合Julia、Mojo和Moonbit的优点。

## 语言特点

- **编码支持**：全局使用UTF-8，同时支持ASCII、GB2312、GBK、GB18030、UTF8-BOM、ANSI、Latin1等多种编码，完美支持中英文混合编程
- **Python风格语法**：使用缩进而非大括号来定义代码块，语法简洁优雅
- **三进制优化**：专为三进制计算机架构设计，充分利用平衡三进制（-1、0、1）的优势
- **高性能计算**：借鉴Julia的多重分派和科学计算能力
- **硬件直接访问**：类似Mojo，可直接操作CPU和GPU
- **显式内存管理**：提供精细的内存控制能力，**无GC**（垃圾回收），完全手动管理内存
- **编译期计算与反射**：支持编译期优化和运行时反射
- **强类型静态语言**：编译时类型检查，提高代码可靠性和性能
- **行尾序列规范**：全局默认为LF（Line Feed），确保跨平台一致性
- **Actor模型**：结合Erlang的Actor并发模型，支持轻量级并发编程
- **C3模块化**：采用类似C3的灵活模块化系统，支持多重继承和组合
- **内联汇编**：支持直接内联汇编代码，实现底层硬件优化
- **中文关键字支持**：`var`的中文关键字是`设`，`let`的中文关键字是`令`
- **池化内存/显存**：内置内存池和显存池管理，优化资源分配和释放
- **Python风格匹配**：支持类似Python的match和match-case语法糖
- **MLIR优化**：使用MLIR技术进行底层代码优化，提升性能
- **Mold链接**：使用Mold高性能链接器加速构建过程
- **完整工具链**：包含编译器(kz cl)和包管理器(kz mod)
- **忆阻器支持**：原生支持直接操作忆阻器设备，为神经形态计算和非易失性内存应用提供基础

## 工具链

- **kz cl**：Kz语言编译器（[compiler/kz_cl.kz](compiler/kz_cl.kz)）
- **kz mod**：包管理器，支持硬链接、workspace和git直连（[compiler/kz_mod.kz](compiler/kz_mod.kz)）
- **kz fmt**：代码格式化工具（[tools/kz_fmt.kz](tools/kz_fmt.kz)）

## 快速开始

### 安装

```bash
# 安装Kz工具链
kz install
```

### 运行Hello World

创建`examples/hello.kz`文件：

```kz
println("Hello, 三进制世界!")
```

编译并运行：

```bash
kz cl examples/hello.kz -o hello
./hello
```

## 包管理kz mod

kz mod使用`package.kz`（TOML格式）管理依赖：

```toml
[package]
name = "my_project"
version = "0.1.0"
description = "My Kz project"

[dependencies]
numpy = "^1.24.0"
linear_algebra = {git = "https://github.com/kz-lang/linear_algebra.git"}

[workspace]
members = ["core", "utils"]
```

## 学习资源

- [本地文档](docs/)
- [示例代码](examples/)
- [官方文档](https://docs.kz-lang.org)
- [API参考](https://docs.kz-lang.org/api)
- [教程](https://docs.kz-lang.org/tutorials)

## 贡献指南

欢迎贡献代码！请查看[CONTRIBUTING.md](./CONTRIBUTING.md)了解更多信息。

## 项目结构

```
Kz/
├── compiler/      # 编译器相关代码
├── tools/         # 开发工具（格式化等）
├── examples/      # 示例代码
├── docs/          # 文档
├── tests/         # 测试代码
├── LICENSE        # 许可证文件
├── README.md      # 项目说明
├── CONTRIBUTING.md # 贡献指南
└── kzconfig.toml  # 配置文件
```

## 许可证

本项目采用**木兰2.0许可证**（MulanPSL-2.0）。