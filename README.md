
# Movies Demo App - iOS
---
Este aplicativo simplesmente consome uma API com os filmes mais aclamados da atualidade e exibe essas informações aos usuários.
<p align="center">
	<img src="img/logo.png" width="120px">
</p>

### Linguagens de programação

- Swift 4.2
<img src="img/swift.png" width="80px">


### Instalação
- Baixar ou clonar o projeto em um diretório do sistema Mac OS
- No terminal, ir até o diretório do projeto e digitar >`pod install`
- Após a instalação dos pods, abrir o arquivo Movies.xcworkspace com o Xcode
- Apertar o botão de Play para rodar o app em um dispositivo ou simulador com iOS 8.0+

### Funcões

- O APP tem 3 telas e consome a API do [themoviedb]("https://api.themoviedb.org/)
- A Primeira tela listar os filmes mais atuais
- A segunda tela mostra o detalhe de algum filme selecionado
- A terceira tela mostrará as opções de compra do filme, porém nao está ainda implementada

### ScreenShots
Veja abaixo como é o aplicativo

<img src="img/home.png" width="500"> 
<img src="img/bookmark.png" width="500"> 
<img src="img/detail.png" width="500"> 
<img src="img/buy.png" width="500">                            


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

### Contem
- Checa se tem conexão com internet.
- Caso haja falha na request, avisa a falha.
- Cache de imagens
- Scroll infinito
- Suporta versão mínima do iOS: 8.0
- Usa um arquivo .gitignore no seu repositório.
- Usa Storyboard e Autolayout (suporta todas as telas de iPhones)
- Suporta orientações Portrait/Landscape.
- Usa CocoaPods
- Usa Alamofire para networking e AlamofireImages para o cache de imagens
- Faz parse de JSON -> Objeto

- Clean-Architecture
- Testes unitários com mocks utilizando XCTest Framework
- Testes funcionais de interface utilizando XCTest
- Apresenta bom desempenho de memória e processamento (testes com Instruments)
- Documentação em código e versionamento seguindo boas práticas
- Interface personalizada deixando app mais fluido

