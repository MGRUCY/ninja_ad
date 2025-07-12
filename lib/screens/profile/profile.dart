import 'package:flutter/material.dart';
import 'package:ninja_ad/models/character.dart';
import 'package:ninja_ad/screens/profile/heart.dart';
import 'package:ninja_ad/screens/profile/skill_list.dart';
import 'package:ninja_ad/screens/profile/stats_table.dart';
import 'package:ninja_ad/services/character_store.dart';
import 'package:ninja_ad/shared/styled_button.dart';
import 'package:ninja_ad/shared/styled_text.dart';
import 'package:ninja_ad/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  // ignore: deprecated_member_use
                  color: AppColors.secondaryColor.withOpacity(0.3),
                  child: Row(
                    children: [
                      Hero(
                        tag:character.id.toString(),
                        child: Image.asset(
                          'assets/img/vocations/${character.vocation.image}',
                          width: 140,
                          height: 140,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeading(character.vocation.title),
                            StyledText(character.vocation.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Heart(character: character)
                ),
              ],
            ),

            

            const SizedBox(
              height: 20,
            ),
            Center(
              child: Icon(
                Icons.code,
                color: AppColors.primaryAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                // ignore: deprecated_member_use
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('slogan'),
                    StyledText(character.slogan),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeading('weapon of choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeading('unique ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            //stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),

            //save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false)
                    .saveCharacter(character);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const StyledHeading('character saved.'),
                  showCloseIcon: true,
                  duration: const Duration(seconds: 3),
                  backgroundColor: AppColors.secondaryColor,
                ));
              },
              child: const StyledText('Save character'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
