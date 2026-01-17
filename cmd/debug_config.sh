#!/bin/bash

# 调试配置同步问题
echo "=== 调试配置同步问题 ==="
echo "时间: $(date)"
echo ""

# 检查环境变量
echo "环境变量:"
echo "start_cmd: '$start_cmd'"
echo "TRIM_APPDEST: '$TRIM_APPDEST'"
echo "TRIM_APP_CONFIG_DIR: '$TRIM_APP_CONFIG_DIR'"
echo ""

# 检查配置文件是否存在
if [ -n "$TRIM_APP_CONFIG_DIR" ]; then
    ENV_FILE="$TRIM_APP_CONFIG_DIR/environment"
    echo "检查配置文件: $ENV_FILE"
    if [ -f "$ENV_FILE" ]; then
        echo "配置文件存在:"
        cat "$ENV_FILE"
    else
        echo "配置文件不存在"
    fi
fi
echo ""

# 检查docker-compose.yaml文件
COMPOSE_FILE="${TRIM_APPDEST}/docker/docker-compose.yaml"
echo "检查docker-compose.yaml: $COMPOSE_FILE"
if [ -f "$COMPOSE_FILE" ]; then
    echo "当前docker-compose.yaml内容:"
    cat "$COMPOSE_FILE"
else
    echo "docker-compose.yaml文件不存在"
fi
echo ""

# 测试脚本执行权限
echo "测试脚本执行权限:"
if [ -w "$COMPOSE_FILE" ]; then
    echo "有写入权限"
else
    echo "没有写入权限"
fi
echo ""

# 记录到日志文件
LOG_FILE="${TRIM_APPDEST}/debug_config.log"
echo "调试信息已记录到: $LOG_FILE"