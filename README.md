# pyramid-thinking — 피라미드 사고법 Claude 플러그인

수평으로 흩어진 지식(How-to, 데이터)을 **L0 존재론 → L1 구조 → L2 선택·트레이드오프 → L3 실행**의
4단계 수직 위계로 정돈하는 사고 프레임을 Claude에 심는 플러그인입니다.
Claude.ai 웹 채팅, Claude 데스크톱(Chat·Cowork), Claude Code 어디서든 같은 레포에서 설치할 수 있습니다.

## 들어 있는 것

| 구성 | 이름 | 하는 일 |
|---|---|---|
| 스킬 | `pyramid-thinking` | 단순하지 않은 요청(여러 단계, 실제 트레이드오프, 모호한 목표, 충돌하는 요구)에서만 목적 → 구조 → 선택 → 실행으로 정렬하는 사고법. 먼저 쓸지 판단하고, 단순 질문은 바로 답한다. 작성자 없이 실행될 계획·티켓·에이전트 지시서에는 항목마다 관찰 가능한 완료 판정·범위·경계를 붙이고, 모든 답은 삭제 시험(지워도 사용자가 할 일을 하는 데 지장이 없는 부분은 지운다)을 거친다. 정의는 `references/ontology.md` |
| 스킬 | `pyramid-lens` | 현상·전략·제품·사건을 L0~L3로 분해하고 원리 렌즈(성경·신화·열역학·진화·면역계·전쟁사·연금술)에 교차 매핑해 방향층/작동층 결합을 진단하는 심층 분석법 |
| 훅 | `SessionStart` | 세션 시작·재개·`/clear`·컨텍스트 압축 때마다 짧은 핵심(`references/core.md`, 약 4.5KB)만 컨텍스트에 주입. 쓸지 판단하는 기준과 최소 절차만 담는다 |

## 설치

### Claude.ai · Claude 데스크톱 · Cowork

1. **Customize → Plugins** 로 이동 (Cowork는 Cowork 탭에서 Customize)
2. **Add → Add marketplace** 선택 후 `justbeatit0503-dot/ODD` 입력
3. 목록에 뜬 **pyramid-thinking** 설치

계정에 저장되므로 웹 채팅, 데스크톱, Cowork, Claude Code(로그인 계정이 같을 때)에서 다시 설치하지 않아도 따라옵니다.
레포 대신 [`dist/pyramid-thinking.plugin`](https://github.com/justbeatit0503-dot/ODD/raw/main/dist/pyramid-thinking.plugin) 파일을 내려받아 **Add → Upload plugin**으로 올려도 됩니다.

### Claude Code (CLI)

```bash
/plugin marketplace add justbeatit0503-dot/ODD
/plugin install pyramid-thinking@knowgram
```

Claude Code 2.1.275 이상이면 한 줄로도 됩니다: `/plugin install pyramid-thinking --marketplace justbeatit0503-dot/ODD`

터미널에서는 `claude plugin marketplace add justbeatit0503-dot/ODD` 후 `claude plugin install pyramid-thinking@knowgram`.
업데이트는 `/plugin marketplace update knowgram`.

## 어디서 무엇이 작동하나

| 환경 | 스킬 2개 | 상시 주입 훅 |
|---|---|---|
| Claude Code | O | O |
| Cowork | O | O |
| Claude.ai 웹 채팅 · 데스크톱 Chat 탭 | O | X (채팅에서는 훅이 실행되지 않음) |

채팅 환경에서는 `pyramid-thinking` 스킬이 관련 요청마다 불려와 훅의 역할을 대신합니다.
채팅에서도 매 턴 무조건 적용되길 원하면 `references/core.md` 내용을 **Settings → Profile**의 개인 선호(personal preferences)에 함께 넣어 두세요.

이미 계정에 `pyramid-lens`를 단독 스킬로 올려 두었다면 같은 스킬이 두 번 보이니 하나는 꺼 두는 것이 좋습니다.

## 레포 구조

```
.claude-plugin/marketplace.json        # 마켓플레이스 정의 (이름: knowgram)
dist/pyramid-thinking.plugin           # 업로드용 패키지
plugins/pyramid-thinking/
├── .claude-plugin/plugin.json
├── hooks/
│   ├── hooks.json                     # SessionStart 등록
│   └── session-start.sh               # core.md를 stdout으로 주입
└── skills/
    ├── pyramid-thinking/
    │   ├── SKILL.md
    │   └── references/core.md         # 훅이 주입하는 짧은 핵심 (판단 기준 + 최소 절차)
    │       ├── references/ontology.md     # 정의와 원리 (필요할 때만 읽음)
    │       └── references/examples.md     # 분야별 예시 (필요할 때만 읽음)
    └── pyramid-lens/
        ├── SKILL.md
        └── references/lenses.md
```

`dist/pyramid-thinking.plugin`은 `plugins/pyramid-thinking` 폴더를 압축한 업로드용 파일입니다. 폴더를 고치면 다시 압축해 갱신하세요:

```bash
rm -f dist/pyramid-thinking.plugin && (cd plugins/pyramid-thinking && zip -r ../../dist/pyramid-thinking.plugin . -x "*.DS_Store")
```

상시 요약을 고칠 때는 `references/core.md`를, 정의를 고칠 때는 `references/ontology.md`를 수정합니다. 두 파일의 용어가 어긋나지 않게 함께 확인하세요.
수정 후에는 `plugin.json`과 `marketplace.json`의 `version`을 올려야 설치된 곳에서 업데이트로 인식합니다.

## 라이선스

별도 오픈소스 라이선스를 지정하지 않았습니다. 피라미드 사고법과 pyramid-lens의 저작권은 Knowgram에 있습니다.
