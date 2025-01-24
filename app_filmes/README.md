
# App Filmes

![Flutter Logo](https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png) ![Dart Logo](https://dart.dev/assets/shared/dart/logo+text/horizontal/white.svg)

Este é um projeto Flutter voltado para estudantes que desejam aprender sobre a construção de aplicativos móveis utilizando Flutter e Dart. O projeto consiste em um aplicativo de filmes que permite aos usuários pesquisar, visualizar detalhes e adicionar comentários sobre filmes.

## Estrutura do Projeto

A estrutura do projeto é organizada da seguinte forma:

```
app_filmes/
├── android/
├── build/
├── ios/
├── lib/
│   ├── controller/
│   │   ├── movie_detail_controller.dart
│   │   └── movie_list_controller.dart
│   ├── data/
│   │   ├── models/
│   │   │   ├── movie.dart
│   │   │   ├── movie_api.dart
│   │   │   └── movie_comment.dart
│   ├── screens/
│   │   ├── movie_detail/
│   │   │   └── widgets/
│   │   │       └── movie_datail_widget.dart
│   │   ├── movie_list/
│   │   │   └── widgets/
│   │   │       ├── movie_item_widget.dart
│   │   │       └── search_dialog.dart
│   │   └── movie_list_screen.dart
│   ├── services/
│   │   └── service_locator.dart
│   ├── widgets/
│   │   ├── progress_indicador_widget.dart
│   │   └── progress_indicador2_widget.dart
│   ├── main.dart
│   └── README.md
├── pubspec.yaml
└── test/
```

## Widgets Utilizados

- **MovieListScreen**: Tela principal que exibe a lista de filmes.
- **MovieDetailWidget**: Tela de detalhes de um filme específico.
- **MovieItemWidget**: Widget que representa um item de filme na lista.
- **SearchDialog**: Diálogo para pesquisa de filmes.
- **ProgressIndicadorWidget**: Indicador de progresso animado.
- **ProgressIndicador2Widget**: Outro indicador de progresso animado.

## Controladores

- **MovieListController**: Controlador responsável por gerenciar a lista de filmes.
- **MovieDetailController**: Controlador responsável por gerenciar os detalhes de um filme específico.

## Modelos

- **Movie**: Modelo que representa um filme.
- **MovieComment**: Modelo que representa um comentário sobre um filme.
- **MovieApi**: Classe responsável por fazer requisições à API de filmes.

## Dependências

As principais dependências utilizadas no projeto são:

- **flutter**: SDK do Flutter.
- **cupertino_icons**: Ícones estilo iOS.
- **get_it**: Injeção de dependências.
- **dio**: Cliente HTTP.
- **logger**: Logger para depuração.
- **flutter_spinkit**: Conjunto de indicadores de progresso animados.
- **lottie**: Animações Lottie.
- **duration**: Manipulação de durações.
- **animations**: Animações do Flutter.
- **get**: Gerenciamento de estado.
- **font_awesome_flutter**: Ícones FontAwesome.
- **flutter_feather_icons**: Ícones Feather.
- **line_awesome_flutter**: Ícones LineAwesome.
- **eva_icons_flutter**: Ícones Eva.

## Animações

O projeto utiliza animações Lottie para os indicadores de progresso, proporcionando uma experiência visual agradável ao usuário.

## Dart

O projeto faz uso extensivo do Dart, a linguagem de programação do Flutter, para definir a lógica de negócios, modelos de dados, controladores e widgets.

## Como Executar

1. Clone o repositório:
    ```sh
    git clone https://github.com/seu-usuario/app-filmes.git
    ```
2. Navegue até o diretório do projeto:
    ```sh
    cd app-filmes
    ```
3. Instale as dependências:
    ```sh
    flutter pub get
    ```
4. Execute o aplicativo:
    ```sh
    flutter run
    ```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---
Feito com ❤️ usando Flutter e Dart.
