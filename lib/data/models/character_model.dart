class CharacterModel{
  late int charId;
  late String name;
  late String birthday;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String status;
  late List<dynamic> appearance;
  late String portrayed;
  late String category;
  late  List<dynamic> betterCallSaulAppearance;
  CharacterModel.fromJson(Map<String,dynamic>json){
    charId=json['char_id'];
    name=json['name'];
    birthday=json['birthday'];
    nickName=json['nickname'];
    image=json['img'];
    status=json['status'];
    jobs=json['occupation'];
    appearance=json['appearance'];
    portrayed=json['portrayed'];
    category=json['category'];
    betterCallSaulAppearance=json['better_call_saul_appearance'];

  }

}