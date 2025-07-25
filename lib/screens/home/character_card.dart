import 'package:flutter/material.dart';
import 'package:ninja_ad/models/character.dart';
import 'package:ninja_ad/screens/profile/profile.dart';
import 'package:ninja_ad/shared/styled_text.dart';
import 'package:ninja_ad/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Row(
          children: [
            Hero(
              tag:character.id.toString(),
              child: Image.asset(
                'assets/img/vocations/${character.vocation.image}',
                width: 80,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => Profile(character: character),
                ));
              },
              icon: Icon(
                Icons.arrow_forward,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
