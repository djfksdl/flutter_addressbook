class AddressbookVo {
  int aNo;
  int cNo;
  int acNo;
  String? name;
  String? hp;
  int? gender;
  String? email;
  String? memo;
  bool? favorite;
  String? cName;

  AddressbookVo({
    required this.aNo,
    required this.cNo,
    required this.acNo,
    required this.name,
    required this.hp,
    required this.gender,
    required this.email,
    required this.memo,
    required this.favorite,
    required this.cName,
  });

  //map--> personVo형식으로 변환
  factory AddressbookVo.fromJson(Map<String, dynamic> apiData) {//map을 00로 빼준다.
    print(apiData);
    return AddressbookVo(
      aNo: apiData['aNo'],
      cNo: apiData['cNo'],
      acNo: apiData['acNo'],
      name: apiData['name'],
      hp: apiData['hp'],
      gender: apiData['gender'],
      email: apiData['email'],
      memo: apiData['memo'],
      favorite: apiData['favorite'],
      cName: apiData['cName'],
    );
  }

  //현재의 PersonVo를 Map형식으로 내보내줌
  Map<String, dynamic> toJson() {
    return {
      'aNo': aNo,
      'cNo': cNo,
      'acNo': acNo,
      'name': name,
      'hp': hp,
      'gender': gender,
      'email': email,
      'memo': memo,
      'favorite': favorite,
      'cName': cName,
    };
  }
}