# 📍 LocalizaAí App

Este projeto Flutter permite o cadastro e visualização de **pontos de interesse (POIs)** utilizando localização em tempo real com o `Geolocator`.

## 📦 Estrutura do Projeto

### `models/poi.dart`

- **Classe `PointOfInterest`**  
  Representa o modelo de dados para cadastro dos pontos de interesse.

---

### `services/location_service.dart`

- **Classe `LocationService`**  
  Serviço responsável por obter a localização do usuário utilizando o pacote `geolocator`.

---

### `services/poi_service.dart`

- **Classe `POIService`**  
  Serviço para gerenciar o cadastro de pontos de interesse utilizando a classe `PointOfInterest`.

---

## 🖥️ Páginas

### `pages/home_page.dart`

- **Classe `HomePage`**  
  Responsável pela visualização da página inicial do app.

  ![image](https://github.com/user-attachments/assets/fa258d46-75d1-4fb1-a40e-d4e0a64f612b)


---

### `pages/location_page.dart`

- **Classe `LocationPage`**  
  Gerencia a lógica e interface da página de localização.

  ![image](https://github.com/user-attachments/assets/cfec6c38-8b88-4a78-8886-9546606dd73e)


  - `_getLocation()` — Função usada para obter a localização atual do usuário.
 
  ![image](https://github.com/user-attachments/assets/ed2de7d1-dd6b-4a91-842d-ec587417ebfe)


---

### `pages/poi_add_page.dart`

- **Classe `POIAddPage`**  
  Responsável pela lógica e visualização da página de cadastro de POIs.

  ![image](https://github.com/user-attachments/assets/0f593925-a249-402d-82a2-d193c221b81d)


  - `_submit()` — Função utilizada para cadastrar um novo ponto de interesse.
 
  ![image](https://github.com/user-attachments/assets/5c82a838-27d9-4bd2-993e-611a54e40f69)


---

### `pages/poi_detail_page.dart`

- **Classe `POIDetailPage`**  
  Gerencia a lógica e interface da página de detalhes de um ponto de interesse.

  ![image](https://github.com/user-attachments/assets/bad2c6af-d970-47c0-914f-28b7fe5cd494)


  - `_calculateDistance()` — Função para calcular a distância entre o ponto cadastrado e a localização atual do usuário.
 
  ![image](https://github.com/user-attachments/assets/f16f6431-bf63-47c6-8e86-425d7544754d)


---

### `pages/poi_list_page.dart`

- **Classe `POIListPage`**  
  Responsável pela lógica e visualização da lista de pontos de interesse.

  ![image](https://github.com/user-attachments/assets/09472be8-f2a9-4423-83dd-c8426114b874)


  - `_navigateToAddPOI()` — Navega para a página de cadastro de novos POIs.
 
  ![image](https://github.com/user-attachments/assets/cea1d077-f952-4368-99ee-218cd78b32d8)

  - `_navigateToDetail()` — Navega para a página de detalhes de um POI selecionado.
 
  ![image](https://github.com/user-attachments/assets/a5d4c349-9885-46b0-a0cf-362c094c2bc4)


---

## 🚀 Funcionalidades

- Obter localização atual do usuário.
- Cadastrar novos pontos de interesse.
- Calcular distância entre o usuário e os pontos cadastrados.
- Visualizar detalhes dos pontos de interesse.
- Listar todos os pontos cadastrados.

---

## 🛠️ Tecnologias Utilizadas

- Flutter
- Dart
- [Geolocator](https://pub.dev/packages/geolocator)

---

## 🛠️ Para rodar o projeto

- Crie uma pasta no lugar que desejar
- Utilize o comando `git clone https://github.com/julioocorrea/LocalizaAiApp` na pasta criada
- Acesse a pasta clonada
- Em seguida utilize o comando `flutter pub get` para atualizar as dependências

---
