class LottoConfig {
  String title;
  String title1;
  String title2;
  String title3;
  String title4;
  String title5;
  String hinttext;
  Hinttext2 hinttext2;
  Keyword keyword;
  int admobisdispaly1;
  int admobisdispaly2;
  int admobrandispaly1;
  int admobrandispaly2;

  LottoConfig(
      {this.title,
      this.title1,
      this.title2,
      this.title3,
      this.title4,
      this.title5,
      this.hinttext,
      this.hinttext2,
      this.keyword,
      this.admobisdispaly1,
      this.admobisdispaly2,
      this.admobrandispaly1,
      this.admobrandispaly2});

  LottoConfig.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    title1 = json['title1'];
    title2 = json['title2'];
    title3 = json['title3'];
    title4 = json['title4'];
    title5 = json['title5'];
    hinttext = json['hinttext'];
    hinttext2 = json['hinttext2'] != null
        ? new Hinttext2.fromJson(json['hinttext2'])
        : null;
    keyword =
        json['keyword'] != null ? new Keyword.fromJson(json['keyword']) : null;
    admobisdispaly1 = json['admobisdispaly1'];
    admobisdispaly2 = json['admobisdispaly2'];
    admobrandispaly1 = json['admobrandispaly1'];
    admobrandispaly2 = json['admobrandispaly2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title1'] = this.title1;
    data['title2'] = this.title2;
    data['title3'] = this.title3;
    data['title4'] = this.title4;
    data['title5'] = this.title5;
    data['hinttext'] = this.hinttext;
    if (this.hinttext2 != null) {
      data['hinttext2'] = this.hinttext2.toJson();
    }
    if (this.keyword != null) {
      data['keyword'] = this.keyword.toJson();
    }
    data['admobisdispaly1'] = this.admobisdispaly1;
    data['admobisdispaly2'] = this.admobisdispaly2;
    data['admobrandispaly1'] = this.admobrandispaly1;
    data['admobrandispaly2'] = this.admobrandispaly2;
    return data;
  }
}

class Hinttext2 {
  List<Lhs> lhs;

  Hinttext2({this.lhs});

  Hinttext2.fromJson(Map<String, dynamic> json) {
    if (json['lhs'] != null) {
      lhs = new List<Lhs>();
      json['lhs'].forEach((v) {
        lhs.add(new Lhs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lhs != null) {
      data['lhs'] = this.lhs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lhs {
  String lhsDrwNo;
  String lhsDrwNoDate;
  String lhsDrwtNo1;
  String lhsDrwtNo2;
  String lhsDrwtNo3;
  String lhsDrwtNo4;
  String lhsDrwtNo5;
  String lhsDrwtNo6;
  String lhsBnusNo;

  Lhs(
      {this.lhsDrwNo,
      this.lhsDrwNoDate,
      this.lhsDrwtNo1,
      this.lhsDrwtNo2,
      this.lhsDrwtNo3,
      this.lhsDrwtNo4,
      this.lhsDrwtNo5,
      this.lhsDrwtNo6,
      this.lhsBnusNo});

  Lhs.fromJson(Map<String, dynamic> json) {
    lhsDrwNo = json['lhs_drwNo'];
    lhsDrwNoDate = json['lhs_drwNoDate'];
    lhsDrwtNo1 = json['lhs_drwtNo1'];
    lhsDrwtNo2 = json['lhs_drwtNo2'];
    lhsDrwtNo3 = json['lhs_drwtNo3'];
    lhsDrwtNo4 = json['lhs_drwtNo4'];
    lhsDrwtNo5 = json['lhs_drwtNo5'];
    lhsDrwtNo6 = json['lhs_drwtNo6'];
    lhsBnusNo = json['lhs_bnusNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lhs_drwNo'] = this.lhsDrwNo;
    data['lhs_drwNoDate'] = this.lhsDrwNoDate;
    data['lhs_drwtNo1'] = this.lhsDrwtNo1;
    data['lhs_drwtNo2'] = this.lhsDrwtNo2;
    data['lhs_drwtNo3'] = this.lhsDrwtNo3;
    data['lhs_drwtNo4'] = this.lhsDrwtNo4;
    data['lhs_drwtNo5'] = this.lhsDrwtNo5;
    data['lhs_drwtNo6'] = this.lhsDrwtNo6;
    data['lhs_bnusNo'] = this.lhsBnusNo;
    return data;
  }
}

class Keyword {
  List<String> keyword;

  Keyword({this.keyword});

  Keyword.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = this.keyword;
    return data;
  }
}
