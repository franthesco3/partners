# partners

O projeto é um desafio de uma proposta a vaga de desenvolvedor Flutter, onde foram implementadas as seguintes features:
- Search
- getPartnes
- Favorites

## Getting Started
Para rodar o projeto, clone o mesmo e rode o seguinte comando no terminal do vs code:
  flutter pub get;
  Quando finalizar esse processo, pode rodar o projeto em modo debbug ou usar o comando flutter run no terminal do vs code.
  
### Observações sobre a construção do projeto
  A arquitetura utilizada foi a MVVM a qual é propícia a mudanças, como refatorações podem acontecer futuramente, as views serão afetadas de forma amenizada, além disso, pode-se implementar de maneira mais facilitada os princípios do solid, deixar o código mais limpo e implementar os testes unitários de maneira mais facilitada
  

  Foi adicionado uma biblioteca para animação da splashScreen (Lottie) para tornar a experiência mais parecida com um app de cenário real.
  
 Abaixo seguem as outras dependências que foram utilizadas no projeto para requisições HTTP (dio), e obter os caminhos dos diretórios do aparelho (path_provider) para salvar os filmes favoritos; 
 
  - dio: ^4.0.4
  - intl: ^0.17.0
  - path_provider: ^2.0.12
  - flutter_slidable: ^2.0.0
  - flutter_native_splash: any
  - flutter_localizations:
    sdk: flutter

