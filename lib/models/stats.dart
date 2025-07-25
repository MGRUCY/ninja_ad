mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defence = 10;
  int _skill = 10;

  //getters
  int get points => _points;
  Map<String, int> get statAsMap => {
        'health': _health,
        'attack': _attack,
        'defence': _defence,
        'skill': _skill,
      };

  List<Map<String, String>> get statsAsformattedList => [
        {'title': 'health', 'value': _health.toString()},
        {'title': 'attack', 'value': _attack.toString()},
        {'title': 'defence', 'value': _defence.toString()},
        {'title': 'skill', 'value': _skill.toString()},
      ];
  //methods
  void increaseStat(String stat) {
    if (_points > 0) {
      if (stat == 'health') {
        _health++;
        _points--;
      }
      if (stat == 'attack') {
        _attack++;
        _points--;
      }
      if (stat == 'defence') {
        _defence++;
        _points--;
      }
      if (stat == 'skill') {
        _skill++;
        _points--;
      }
    }
  }

  void decreaseStat(String stat) {
    if (stat == 'health' && _health >= 5) {
      _health--;
      _points++;
    }
    if (stat == 'attack' && _attack >= 5) {
      _attack--;
      _points++;
    }
    if (stat == 'defence' && _defence >= 5) {
      _defence--;
      _points++;
    }
    if (stat == 'skill' && _skill >= 5) {
      _skill--;
      _points++;
    }
  }

  void setStats({required int points, required Map<String, dynamic> stats}) {
    _points = points;
    _health = stats["health"];
    _defence = stats["defence"];
    _attack = stats["attack"];
    _skill = stats["skill"];
  }
}
