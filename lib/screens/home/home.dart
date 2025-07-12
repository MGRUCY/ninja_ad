import 'package:flutter/material.dart';
import 'package:ninja_ad/screens/create/create.dart';
import 'package:ninja_ad/services/character_store.dart';
import 'package:ninja_ad/shared/styled_button.dart';
import 'package:ninja_ad/shared/styled_text.dart';
import 'package:ninja_ad/screens/home/character_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('HOME'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: ValueKey((value.characters[index]).id),
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(context, listen: false).removeCharacter((value.characters[index]));
                        },
                        child: CharacterCard((value.characters[index])),
                      );
                    });
              }),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: const StyledHeading('character list'),
            ),
            StyledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CreateScreen()));
                },
                child: const StyledHeading('Create new')),
          ],
        ),
      ),
    );
  }
}
