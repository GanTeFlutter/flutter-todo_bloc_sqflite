## 📂 Proje Yapısı (Mermaid)

```mermaid
graph TD
  ROOT[flutter-todo-app]

  ROOT --> A[lib]
  ROOT --> H[module]

  %% lib yapısı
  A --> B[future]
  B --> C[drawer_home]
  C --> C1[state]
  C --> C2[widget]
  C --> C3[drawer_home.dart]
  B --> D[splash]
  D --> D1[state]
  D --> D2[splash_view.dart]
  D --> D3[update_version_view.dart]
  B --> E[todos]
  E --> E1[mixin]
  E --> E2[state]
  E --> E3[widget]
  E --> E4[todo_view.dart]
  A --> F[product]
  F --> F1[constant]
  F --> F2[enum]
  F --> F3[extension]
  F --> F4[init]
  F --> F5[navigation]
  F --> F6[service]
  F --> F7[widget]
  A --> G[main.dart]

  %% module yapısı
  H --> I[lib]
  I --> J[src]
  J --> J1[assets]
  J --> J2[environment]
  J --> J3[model]
  I --> J4[gen.dart]
