import 'package:flutter/material.dart';
import 'package:tbr_mobile/tutorial/widgets/tutorial_card.dart';

class TutorialBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TutorialCard(
            color: Color(0xff78e08f),
            title: 'O que é TBR?',
            information:
                'TBR é uma sigla inglesa (To Be Read) Uma lista de livros que você tem para ler.',
          ),
          SizedBox(width: 10),
          TutorialCard(
            color: Color(0xff38ada9),
            title: 'O que faz?',
            information:
                'Tornou-se uma prática comum o sorteio de um livro aleatório da sua lista para ser a próxima leitura.',
          ),
          SizedBox(width: 10),
          TutorialCard(
            color: Color(0xff079992),
            title: 'O que faz este aplicativo?',
            information:
                'Esse aplicativo maravilhoso te auxiliará no sorteio da sua TBR! Basta você adicionar a lista dos seus livros a serem lidos e sortear a sua próxima leitura.',
          ),
        ],
      ),
    );
  }
}
