#!/bin/bash

# Kz格式化工具执行脚本
# 许可证：木兰2.0（Mulan PSL v2）

# 检查kz编译器是否存在
if ! command -v kzc &> /dev/null; then
    echo "错误：未找到Kz编译器 (kzc)"
    echo "请确保kzc已安装并添加到PATH环境变量中"
    exit 1
fi

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 格式化工具的Kz源代码文件
FMT_SOURCE="$SCRIPT_DIR/kz_fmt.kz"

# 检查源文件是否存在
if [ ! -f "$FMT_SOURCE" ]; then
    echo "错误：未找到格式化工具源代码 $FMT_SOURCE"
    exit 1
fi

# 编译格式化工具（如果需要）
FMT_BINARY="$SCRIPT_DIR/kz_fmt"
if [ ! -f "$FMT_BINARY" ] || [ "$FMT_SOURCE" -nt "$FMT_BINARY" ]; then
    echo "编译kz_fmt工具..."
    if kzc -o "$FMT_BINARY" "$FMT_SOURCE"; then
        echo "编译成功"
    else
        echo "编译失败"
        exit 1
    fi
fi

# 执行格式化工具，传递所有参数
"$FMT_BINARY" "$@"
exit $?