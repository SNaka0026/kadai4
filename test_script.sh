#!/bin/bash

SCRIPT="./script.sh"
PASS_COUNT=0
FAIL_COUNT=0

# 1. 正常系テスト
OUTPUT=$($SCRIPT 12 18 2>&1)
echo "[テスト1] 正常系: 12と18の最大公約数"
echo " 実行結果: $OUTPUT"
echo

# 2. 引数が1つのとき
OUTPUT=$($SCRIPT 10 2>&1)
echo "[テスト2] 引数が1つ"
echo " 実行結果: $OUTPUT"
echo

# 3. 引数が0のとき
OUTPUT=$($SCRIPT 2>&1)
echo "[テスト3] 引数なし"
echo " 実行結果: $OUTPUT"
echo

# 4. 引数が文字列のとき
OUTPUT=$($SCRIPT a b 2>&1)
echo "[テスト4] 引数が文字列"
echo " 実行結果: $OUTPUT"
echo

# 5. 負の数が含まれるとき
OUTPUT=$($SCRIPT -5 10 2>&1)
echo "[テスト5] 引数に負の数を含む"
echo " 実行結果: $OUTPUT"
echo

# 6. 引数に0を含む
OUTPUT=$($SCRIPT 0 5 2>&1)
echo "[テスト6] 引数に0を含む"
echo " 実行結果: $OUTPUT"
echo


