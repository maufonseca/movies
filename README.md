
# Movies Demo App - iOS <img src="img/logo.png" width="24px">

Este aplicativo consome uma API com os filmes mais aclamados da atualidade e exibe essas informações aos usuários.
A intenção é demonstrar o uso de Swift 4.2 para funcionalidades básicas como estruturação de layout adaptável a diversas dimensões de tela e orientação de dispositivo, chamadas a uma API REST através da biblioteca Alamofire, lida com imagens e cache, persistência do modelo de dados com Realm, suporte a dispositivos antigos com iOS 8.0, organização das features nas camadas da arquitetura Clean, implantação de testes de unidade, de interface e localização do app para PT-BR.

### Linguagem utilizada

- Swift 4.2 <img src="img/swift.png" width="16px">


### Instalar/Rodar
1. Baixar ou clonar o projeto em um diretório do sistema Mac OS
1. No terminal, ir até o diretório do projeto e digitar >`pod install`
1. Após a instalação dos pods, abrir o arquivo Movies.xcworkspace com o Xcode
1. Apertar o botão de Play para rodar o app em um dispositivo ou simulador com iOS 8.0+

### Rodando os testes automáticos
1. Abrir o projeto no Xcode utilizando os passos acima
1. É necessário rodar os **testes em um iOS 9+**, independente do app ser compatível com iOS 8+.
1. Abrir o navegador de testes do Xcode (CMD + 6)
1. Apertar o botão de play na frente do testes mostrados no navegador de teste

### Descrição
- O APP tem 3 telas e consome a API do [themoviedb]("https://api.themoviedb.org/)
- A Primeira tela listar os filmes mais atuais
- A segunda tela mostra o detalhe de algum filme selecionado
- A terceira tela mostrará as opções de compra do filme, porém nao está ainda implementada

### ScreenShots
Veja abaixo como é o aplicativo

<img src="img/home.png" width="400"> 
<img src="img/bookmark.png" width="400"> 
<img src="img/detail.png" width="400"> 
<img src="img/buy.png" width="400">                            


### Tela de principal/tela de favoritos
- A aba de filmes consome a API de lista de filmes do themoviedb, retorna todos os filmes paginados de 20 em 20 itens.
- A aba de favoritos mostrar somente os filmes favoritados que permanecem num banco de dados do dispositivo.
- Scroll inifinito

### Tela de detalhe do filme
- Pega as informações do filme usando o ID do mesmo.
- Usa Realm para favoritar o filme.
- Checa se filme já está salvo, se estiver, troca botão para remover do favorito.

### Tela de compra do filme
- Como não há opção de compra nessa API do themoviedb, mostra um empty state.

### Funcionalidades implementadas
1. Compila sem erros e nem warnings
1. Checa se tem conexão com interne.
1. Caso haja falha na request, avisa a falha
1. Cache de imagens
1. Scroll infinito na collection view
1. Suporta versão mínima do iOS: 8.0
1. Usa um arquivo .gitignore no seu repositório.
1. Usa Storyboard e Autolayout (suporta todas as telas de iPhones)
1. Suporta orientações Portrait/Landscape.
1. Usa CocoaPods
1. Usa Alamofire para networking e AlamofireImages para o cache de imagens
1. Faz parse de JSON -> Objeto
1. Clean-Architecture
1. Localização do app para pt-BR (Base English)
1. Testes unitários com mocks utilizando XCTest Framework
1. Testes funcionais de interface utilizando XCTest
1. Apresenta bom desempenho de memória e processamento (testes com Instruments)
1. Documentação em código e versionamento seguindo boas práticas
1. Interface deslizável (scrolls) deixando app mais fluido em todas as telas

