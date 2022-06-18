class Character {
  late int charId;
  late String name;
  late List<String> occupation;
  late String img;
  late String status;
  late String nickname;
  late List<int> appearance;
  late String portrayed;
  late String category;
  late List<int> betterCallSaulAppearance;
  Character(
      {required this.appearance,
      required this.betterCallSaulAppearance,
      required this.category,
      required this.charId,
      required this.img,
      required this.name,
      required this.nickname,
      required this.occupation,
      required this.portrayed,
      required this.status});
  factory Character.fromJson(Map<String, dynamic> map) => Character(
      appearance: List<int>.from(map['appearance']),
      betterCallSaulAppearance:
          List<int>.from(map['better_call_saul_appearance']),
      category: map['category'],
      charId: map['char_id'],
      img: map['img'],
      name: map['name'],
      nickname: map['nickname'],
      occupation: List<String>.from(map['occupation']),
      portrayed: map['portrayed'],
      status: map['status']);
}
