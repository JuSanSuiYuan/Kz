#!/bin/bash
# kz cl编译器使用示例脚本
# 注意：这是示例脚本，展示kz cl编译器的使用方式

echo "=== Kz编程语言编译器(kz cl)使用示例 ==="
echo ""

# 显示编译器版本
echo "1. 显示编译器版本信息:"
echo "   kz cl --version"
echo "   # 预期输出: Kz编译器 (kz cl) 版本 1.0.0"
echo ""

# 基本编译
echo "2. 基本编译示例:"
echo "   kz cl hello.kz -o hello"
echo "   # 编译hello.kz并输出可执行文件hello"
echo ""

# 优化级别设置
echo "3. 设置优化级别:"
echo "   kz cl -O3 advanced_example.kz -o advanced"
echo "   # 使用最高优化级别O3编译高级示例"
echo ""

# 三进制特定优化
echo "4. 启用三进制特定优化:"
echo "   kz cl --trinary-mode balanced --trinary-optimize hello.kz -o hello_trinary"
echo "   # 使用平衡三进制模式并启用特定优化"
echo ""

# 调试信息
echo "5. 生成调试信息:"
echo "   kz cl -g -DDEBUG=1 hello.kz -o hello_debug"
echo "   # 生成调试信息并定义DEBUG宏"
echo ""

# 交叉编译
echo "6. 交叉编译到不同目标:"
echo "   kz cl --target trinary_gpu advanced_example.kz -o advanced_gpu"
echo "   # 交叉编译到三进制GPU目标"
echo ""

# 编译期计算
echo "7. 启用编译期计算:"
echo "   kz cl --compile-time-compute advanced_example.kz -o advanced_ctc"
echo "   # 启用编译期计算优化"
echo ""

# 显示编译统计
echo "8. 显示编译统计信息:"
echo "   kz cl --stats hello.kz -o hello"
echo "   # 显示编译统计，包括三进制优化效果"
echo ""

# 并行编译
echo "9. 启用并行编译:"
echo "   kz cl -j 8 --parallel lib/*.kz -o libkz.so"
echo "   # 使用8个线程并行编译库文件"
echo ""

# 链接外部库
echo "10. 链接外部库:"
echo "    kz cl main.kz -L./lib -lkz_math -lkz_gpu -o main"
echo "    # 链接数学库和GPU库"
echo ""

echo "=== kz cl编译器高级特性 ==="
echo ""

# 编译器插件
echo "1. 使用编译器插件:"
echo "   kz cl --plugin ./plugins/coverage.kz.so hello.kz -o hello"
echo "   # 使用代码覆盖率插件"
echo ""

# 内存安全检查
echo "2. 启用内存安全检查:"
echo "   kz cl --memory-checks=strict hello.kz -o hello_safe"
echo "   # 启用严格的内存安全检查"
echo ""

# 三进制位操作优化
echo "3. 三进制位操作优化:"
echo "   kz cl --trinary-bit-optimize matrix_mult.kz -o matrix_mult"
echo "   # 针对三进制位操作进行特殊优化"
echo ""

# 编译期反射
echo "4. 启用编译期反射:"
echo "   kz cl --compile-time-reflection reflection_example.kz -o reflection"
echo "   # 启用编译期反射功能"
echo ""

# 自定义编译配置
echo "5. 使用自定义编译配置:"
echo "   kz cl --config custom_config.toml hello.kz -o hello_custom"
echo "   # 使用自定义配置文件"
echo ""

echo "=== 三进制特定优化示例 ==="
echo ""
echo "1. 平衡三进制算术优化:"
echo "   # Kzc自动识别可以利用三进制对称性的算术操作"
echo "   # 例如: x * 3^n 可以转换为三进制左移操作"
echo ""
echo "2. 三进制条件分支优化:"
echo "   # Kzc优化包含三个状态的条件分支，比二进制更高效"
echo ""
echo "3. 三进制内存访问模式:"
echo "   # 优化内存访问模式以适应三进制存储结构"
echo ""
echo "4. 三进制向量指令:"
echo "   # 利用三进制CPU的向量指令集进行并行计算"
echo ""
echo "注意: 以上命令为示例，实际使用时需要根据Kz语言的具体实现进行调整。"