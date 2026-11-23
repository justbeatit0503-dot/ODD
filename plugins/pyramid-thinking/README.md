# pyramid-thinking

피라미드 사고법(L0 존재론 → L1 구조 → L2 로직·트레이드오프 → L3 실행)을 Claude의 기본 사고 프레임으로 심는 플러그인입니다.

- **pyramid-thinking 스킬** — 지식·방법론·업무 실행이 걸린 요청마다 L0~L3로 생각을 정렬합니다. 원문은 `skills/pyramid-thinking/references/ontology.md`.
- **pyramid-lens 스킬** — 현상·전략·제품을 L0~L3로 분해하고 원형적 렌즈(성경·신화·열역학·진화 등)에 교차 매핑해 상체/하체 결합 상태를 진단하는 심층 분석법.
- **SessionStart 훅** — Claude Code와 Cowork에서 세션 시작·재개·`/clear`·컨텍스트 압축 때마다 원문을 컨텍스트에 주입합니다. 웹 채팅에서는 훅이 돌지 않으므로 스킬이 그 역할을 대신합니다.

Claude Code 설치:

```bash
/plugin install pyramid-thinking --marketplace justbeatit0503-dot/ODD
```

Claude.ai·데스크톱·Cowork에서는 Customize → Plugins → Add marketplace에 `justbeatit0503-dot/ODD`를 입력합니다.

설치와 환경별 동작은 레포 루트의 README를 참고하세요: https://github.com/justbeatit0503-dot/ODD
