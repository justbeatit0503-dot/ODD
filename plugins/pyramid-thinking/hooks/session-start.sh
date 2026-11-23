#!/usr/bin/env bash
# 세션 시작·재개·/clear·컴팩션 때마다 피라미드 사고법 원문을 컨텍스트에 주입한다.
ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
SRC="$ROOT/skills/pyramid-thinking/references/ontology.md"
[ -f "$SRC" ] || exit 0
printf '%s\n\n' "[pyramid-thinking 플러그인] 아래는 사용자의 상시 지침이다. 이 세션의 모든 지식·방법론·업무 작업에 기본 사고 프레임으로 적용하라."
cat "$SRC"
exit 0
