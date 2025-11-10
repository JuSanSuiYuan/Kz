#!/bin/bash
# Kz包管理器(kz mod)使用示例脚本
# 注意：这是示例脚本，展示kz mod的使用方式

echo "=== Kz包管理器(kz mod)使用示例 ==="
echo ""

# 初始化项目
echo "1. 初始化新项目:"
echo "   kz mod init my_project"
echo "   # 创建新的Kz项目和package.kz文件"
echo ""

# 添加依赖
echo "2. 添加依赖:"
echo "   kz mod add math"
echo "   # 添加math依赖，类似pnpm的硬链接机制"
echo "   kz mod add scientific --features advanced"
echo "   # 添加带特性的依赖"
echo ""

# 从Git添加依赖
echo "3. 从Git仓库添加依赖:"
echo "   kz mod add git https://github.com/kz-lang/data_structures.git"
echo "   # 从Git仓库添加依赖"
echo "   kz mod add git https://github.com/kz-lang/utils.git --tag v1.0.0"
echo "   # 指定版本标签"
echo ""

# 添加本地依赖
echo "4. 添加本地依赖(使用硬链接):"
echo "   kz mod add path ../utils"
echo "   # 添加本地路径依赖，默认使用硬链接"
echo ""

# 安装依赖
echo "5. 安装所有依赖:"
echo "   kz mod install"
echo "   # 安装package.kz中定义的所有依赖"
echo ""

# 安装开发依赖
echo "6. 安装开发依赖:"
echo "   kz mod install --dev"
echo "   # 安装开发依赖"
echo ""

# 更新依赖
echo "7. 更新依赖:"
echo "   kz mod update"
echo "   # 更新所有依赖到最新版本"
echo "   kz mod update math"
echo "   # 只更新特定依赖"
echo ""

# 移除依赖
echo "8. 移除依赖:"
echo "   kz mod remove math"
echo "   # 移除依赖并更新package.kz"
echo ""

# 列出依赖
echo "9. 列出已安装的依赖:"
echo "   kz mod list"
echo "   # 显示已安装的依赖列表"
echo "   kz mod list --tree"
echo "   # 显示依赖树"
echo ""

# 检查依赖
echo "10. 检查依赖问题:"
echo "    kz mod check"
echo "    # 检查并报告依赖冲突或问题"
echo ""

# 清理缓存
echo "11. 清理缓存:"
echo "    kz mod cache clean"
echo "    # 清理包缓存"
echo ""

# 导出锁定文件
echo "12. 导出锁定文件:"
echo "    kz mod lock"
echo "    # 生成package.lock.kz锁定文件"
echo ""

echo "=== Workspace功能示例 ==="
echo ""

# 创建workspace
echo "1. 创建workspace:"
echo "   mkdir -p workspace/{core,utils,examples}"
echo "   cd workspace"
echo "   kz mod init --workspace"
echo "   # 在package.kz中配置workspace.members"
echo ""

# 在workspace中添加依赖
echo "2. 在workspace中添加共享依赖:"
echo "   # 在workspace根目录"
echo "   kz mod add math --workspace"
echo "   # 添加workspace级别依赖，所有子包共享"
echo ""

# 在子包中添加依赖
echo "3. 在子包中添加特定依赖:"
echo "   cd core"
echo "   kz mod add utils --path ../utils"
echo "   # 子包添加对另一个子包的依赖"
echo ""

# 在workspace中安装所有依赖
echo "4. 在workspace中安装所有依赖:"
echo "   # 在workspace根目录"
echo "   kz mod install --workspace"
echo "   # 安装所有子包的依赖"
echo ""

# 在workspace中运行命令
echo "5. 在workspace中运行命令:"
echo "   # 在workspace根目录"
echo "   kz mod run --workspace -- kzc --version"
echo "   # 在所有子包中运行命令"
echo ""

echo "=== 三进制特定依赖管理 ==="
echo ""

echo "1. 添加针对三进制优化的依赖:"
echo "   kz mod add trinary_math --features balanced"
echo "   # 添加专为平衡三进制优化的数学库"
echo ""
echo "2. 依赖冲突解决:"
echo "   kz mod resolution-strategy lowest"
echo "   # 设置依赖版本解析策略"
echo ""
echo "3. 硬链接管理:"
echo "   kz mod link --force"
echo "   # 强制重新创建硬链接"
echo ""
echo "4. 离线模式:"
echo "   kz mod install --offline"
echo "   # 离线安装模式"
echo ""
echo "5. 依赖分析:"
echo "   kz mod analyze --trinary-impact"
echo "   # 分析依赖对三进制优化的影响"
echo ""

echo "注意: 以上命令为示例，实际使用时需要根据Kz语言的具体实现进行调整。"