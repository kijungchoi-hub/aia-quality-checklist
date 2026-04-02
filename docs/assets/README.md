# Assets

> 문서와 향후 정적 사이트 구성을 위한 공용 자산 폴더

| 파일 | 용도 |
|---|---|
| `favicon.svg` | 문서/사이트 공용 파비콘 자산 |

## 사용 메모

- 현재 저장소에는 HTML 헤더나 정적 사이트 설정이 없어 파비콘을 자동 연결할 지점은 없다.
- 추후 HTML 또는 문서 사이트를 구성하면 `docs/assets/favicon.svg`를 `icon` 링크로 연결하면 된다.

```html
<link rel="icon" href="/docs/assets/favicon.svg" type="image/svg+xml">
```
