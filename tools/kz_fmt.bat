@echo off

REM Kz格式化工具Windows执行脚本
REM 许可证：木兰2.0（Mulan PSL v2）

REM 检查kz编译器是否存在
where kzc >nul 2>nul
if %errorlevel% neq 0 (
    echo 错误：未找到Kz编译器 (kz cl)
    echo 请确保kz cl已安装并添加到PATH环境变量中
    exit /b 1
)

REM 获取脚本所在目录
set "SCRIPT_DIR=%~dp0"

REM 格式化工具的Kz源代码文件
set "FMT_SOURCE=%SCRIPT_DIR%kz_fmt.kz"

REM 检查源文件是否存在
if not exist "%FMT_SOURCE%" (
    echo 错误：未找到格式化工具源代码 %FMT_SOURCE%
    exit /b 1
)

REM 编译格式化工具（如果需要）
set "FMT_BINARY=%SCRIPT_DIR%kz_fmt.exe"
if not exist "%FMT_BINARY%" goto 编译

REM 检查源文件是否比二进制文件新
for %%I in ("%FMT_SOURCE%") do set "SOURCE_TIME=%%~tI"
for %%I in ("%FMT_BINARY%") do set "BINARY_TIME=%%~tI"

REM 简单的时间比较（可能不精确，但足够日常使用）
if "%SOURCE_TIME%" gtr "%BINARY_TIME%" goto 编译

:运行
REM 执行格式化工具，传递所有参数
"%FMT_BINARY%" %*
exit /b %errorlevel%

:编译
echo 编译kz_fmt工具...
kzc -o "%FMT_BINARY%" "%FMT_SOURCE%"
if %errorlevel% neq 0 (
    echo 编译失败
    exit /b 1
)
echo 编译成功
goto 运行