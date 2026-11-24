#!/usr/bin/env bash
# 세션 시작·재개·/clear·컴팩션 때마다 피라미드 사고법의 짧은 핵심(core.md)만 컨텍스트에 주입한다.
ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
SRC="$ROOT/skills/pyramid-thinking/references/core.md"
[ -f "$SRC" ] || exit 0
printf '%s\n\n' "[pyramid-thinking 플러그인] 아래는 상시 지침이다. 먼저 이 방법을 쓸지 판단하고, 해당할 때만 적용하라."
cat "$SRC"
exit 0
