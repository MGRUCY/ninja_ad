import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ninja_ad/models/skill.dart';
import 'package:ninja_ad/models/stats.dart';
import 'package:ninja_ad/models/vocation.dart';

class Character with Stats {
  // constructer
  Character({
    required this.name,
    required this.slogan,
    required this.id,
    required this.vocation,
  });

  //fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  //getters
  get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // characters to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statAsMap,
      'points': points,
    };
  }

  // character from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options
  ){
      // get data from snapshot
      final data = snapshot.data()!;

      //make character instance
      Character character = Character(
        name: data['name'],
        slogan: data['slogan'],
        id: snapshot.id,
        vocation: Vocation.values
          .firstWhere((v) => v.toString() == data['vocation'])
      );

      // update skills
      for (String id in data['skills']) {
        Skill skill = allSkills.firstWhere((element) => element.id == id);
        character.updateSkill(skill);
      }

      // set isfav
      if (data['isFav'] == true) {
        character.toggleIsFav();
      }

      // assign stats & points
      character.setStats(points: data['points'], stats: data['stats']);

      return character;
    }
}

List<Character> characters = [
  Character(
      id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
  Character(
      id: '2',
      name: 'Jonny',
      vocation: Vocation.junkie,
      slogan: 'Light me up...'),
  Character(
      id: '3',
      name: 'Crimson',
      vocation: Vocation.raider,
      slogan: 'Fire in the hole!'),
  Character(
      id: '4',
      name: 'Shaun',
      vocation: Vocation.ninja,
      slogan: 'Alright then gang.'),
];
