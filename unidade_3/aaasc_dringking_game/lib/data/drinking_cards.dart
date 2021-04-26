import 'package:aaasc_drinking_game/model/drinking_card.dart';

final dummyDrinkingCards = [
  DrinkingCard(
    name: 'Cuba no tênis',
    category: 'Desafio',
    difficulty: 5,
    description: '''
- O jogador deve jogar bebida no tênis e beber
- Caso não cumpra é punido com 5 rodadas
bebendo o dobro
''',
    imgUrl: 'assets/card1.png',
  ),
  DrinkingCard(
    name: 'Body Shot',
    category: 'Picantes',
    difficulty: 4,
    description: '''
Escolha uma parte do corpo de alguém,
derrame a bebida no lugar escolhido e beba
''',
    imgUrl: 'assets/card2.png',
  ),
  DrinkingCard(
    name: 'Bicho Bebe',
    category: 'Jogos',
    difficulty: 1,
    description: '''
- Cada jogador escolhe um bicho
- Depois disso você começa intimando
alguém, exemplo "Urso bebe"
- A pessoa que é o Urso deve responder 
rápidamente:
"Urso não bebe, quem bebe é o Leão"
- O jogador que errar ou demorar deverá beber
''',
    imgUrl: 'assets/card3.png',
  ),
  DrinkingCard(
    name: 'Apelido',
    category: 'Regras',
    difficulty: 3,
    description: '''
- De um apelido para cada um dos jogadores.
- A partir de agora cada um deve ser chamado
apenas pelo seu apelido, se alguém errar bebe!
- Os apelidos valem por duas rodadas
''',
    imgUrl: 'assets/card4.png',
  ),
  DrinkingCard(
    name: 'Regra Geral',
    category: 'Regras',
    difficulty: 4,
    description: '''
- Pense numa regra, a partir de agora todos
devem cumpri-la
- Por exemplo: "Quando alguém beber a pessoa
da frente deve beber também"
''',
    imgUrl: 'assets/card5.png',
  ),
  DrinkingCard(
    name: 'Drink',
    category: 'Vantagem',
    difficulty: 1,
    description: '''
Escolha uma pessoa para beber
''',
    imgUrl: 'assets/card6.png',
  ),
  DrinkingCard(
    name: 'Você me conhece?',
    category: 'Desafio',
    difficulty: 1,
    description: '''
Faça uma pergunta a alguém sobre você,
se a pessoa acertar você deverá beber,
se ela errar, ela bebe.
''',
    imgUrl: 'assets/card_wip.png',
  ),
  DrinkingCard(
    name: 'Falando pelas costas',
    category: 'Desafio',
    difficulty: 2,
    description: '''
Escreva uma mensagem com o dedo nas 
costas de uma pessoa
Se ela acertar o que você escreveu
você bebe, se ela errar, ela bebe
''',
    imgUrl: 'assets/card_wip.png',
  ),
  DrinkingCard(
    name: 'Sotaque',
    category: 'Regras',
    difficulty: 2,
    description: '''
- Escolha um sotaque, pode ser de 
famoso ou de uma região
- Quem falar sem o sotaque bebe
- O sotaque vale por uma rodada
''',
    imgUrl: 'assets/card_wip.png',
  ),
  DrinkingCard(
    name: 'Não pisque',
    category: 'Desafio',
    difficulty: 1,
    description: '''
Atenção! O próximo a piscar bebe
''',
    imgUrl: 'assets/card_wip.png',
  ),
];
