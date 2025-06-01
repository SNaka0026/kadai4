#!/bin/bash

# 引数の数をチェック
if [ $# -ne 2 ]; then
    echo "右記のように指定してください: $0 自然数1 自然数2" >&2
    exit 1
fi

a=$1
b=$2

# 自然数かどうかをチェック（1以上）
if ! [[ "$a" =~ ^[1-9][0-9]*$ && "$b" =~ ^[1-9][0-9]*$ ]]; then
    echo "エラー: 両方の引数は自然数（1以上の整数）でなければなりません" >&2
    exit 1
fi

# bc を使ったユークリッドの互除法（任意精度）
gcd() {
    echo "
    define gcd(a, b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }
    gcd($1, $2)
    " | bc
}

result=$(gcd "$a" "$b")

echo "最大公約数は: $result"

