## Uygulama Resimleri 

<!-- 1. sıra -->
<p float="left">
  <img src="https://github.com/user-attachments/assets/83183148-a4cf-4920-91e7-230b0dfb6fb4" width="200" />
  <img src="https://github.com/user-attachments/assets/a838b841-37f2-4966-953a-79307be8f470" width="200" />
  <img src="https://github.com/user-attachments/assets/148dc239-68fe-440b-ae79-bd6865652277" width="200" />
</p>

<!-- 2. sıra -->
<p float="left">
  <img src="https://github.com/user-attachments/assets/01c984cc-2403-4ed6-87db-bc12da8d1ff3" width="200" />
  <img src="https://github.com/user-attachments/assets/064aecb2-1021-4d0e-b4b6-f0854cf19d54" width="200" />
  <img src="https://github.com/user-attachments/assets/93abd7e5-1eea-4a3e-9b71-2b1c35d4877f" width="200" />
</p>





## 🧱 Klasör Açıklamaları
### 🗂️ lib/
Uygulamanın ana kaynak kodlarını içerir.

- **future/** → Özellik (feature) bazlı yapı. Her alt klasör bir ekran veya modül temsil eder.  
  - **drawer_home/** → Ana menü (Drawer) ekranı ve bileşenleri.  
    - `state/`: 
    - `widget/`: 
    - `drawer_home.dart`:  
  - **splash/** → Uygulama açılış (splash) ekranı.  
    - `state/`: 
    - `splash_view.dart`:   
    - `update_version_view.dart`: 
  - **todos/** → Todo listesi modülü.  
    - `mixin/`:
    - `state/`: 
    - `widget/`: 
    - `todo_view.dart`: 

- **product/** → Uygulama genelinde tekrar kullanılabilir yapı taşlarını içerir.  
  - `constant/`: Sabitler,paddgingler vs
  - `enum/`: Uygulama genelinde kullanılan enum tanımları.  
  - `extension/`: Yardımcı uzantılar 
  - `init/`: (app_initialize, state_initialize)  
  - `navigation/`: Yönlendirme yönetimi (GoRouter)  
  - `service/`: (get_it)  
  - `widget/`:   
- **main.dart** → Uygulamanın giriş noktası.

---

### 🧩 module/
genellikle bağımsız veya dışa açık parçalardır.
code generation lar burada toplanr








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



