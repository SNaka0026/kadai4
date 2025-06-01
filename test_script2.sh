#!/bin/bash

SCRIPT="./script.sh"
PASS_COUNT=0
FAIL_COUNT=0

# テスト実行関数
run_test() {
    local test_name="$1"
    local args="$2"
    local expected="$3"

    OUTPUT=$($SCRIPT $args 2>&1)
    echo "[$test_name]"
    echo " 実行: $SCRIPT $args"
    echo " 出力: $OUTPUT"

    if echo "$OUTPUT" | grep -q "$expected"; then
        echo " 成功: '$expected' を含んでいます"
        PASS_COUNT=$((PASS_COUNT + 1))
    else
        echo " 失敗: '$expected' を含んでいません" >&2
        FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
    echo
}

echo "===== script.sh テスト開始 ====="

# 各テストの実行
run_test "テスト1: 正常系（12と18）"       "12 18" "最大公約数は: 6"
run_test "テスト2: 引数が1つ（10）"        "10"    "右記"
run_test "テスト3: 引数なし"              ""      "右記"
run_test "テスト4: 引数が文字列（a b）"    "a b"   "自然数"
run_test "テスト5: 負の数（-5 10）"        "-5 10" "自然数"
run_test "テスト6: 小数" "1.5 2.5" "自然数"
run_test "テスト7: 極端に大きい数字 " "100000000000000000000000000 5555555" "最大公約数" 

# 結果まとめ
echo "==============================="
echo "合格  : $PASS_COUNT"
echo "不合格: $FAIL_COUNT"
echo "==============================="

# GitHub Actions 向けの終了コード
if [ "$FAIL_COUNT" -ne 0 ]; then
    echo "失敗テストがあります。GitHub Actionsがエラーとして検出します。" >&2
    exit 1
else
    exit 0
fi

