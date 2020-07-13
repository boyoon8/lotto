class LottoData {
  List<Data> data;

  LottoData({this.data});

  LottoData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int lhsLottoNum;
  int cnt;
  List<LhsDrwNo> lhsDrwNo;
  String postContent;

  Data({this.lhsLottoNum, this.cnt, this.lhsDrwNo, this.postContent});

  Data.fromJson(Map<String, dynamic> json) {
    lhsLottoNum = json['lhs_lotto_num'];
    cnt = json['cnt'];
    if (json['lhs_drwNo'] != null) {
      lhsDrwNo = new List<LhsDrwNo>();
      json['lhs_drwNo'].forEach((v) {
        lhsDrwNo.add(new LhsDrwNo.fromJson(v));
      });
    }
    postContent = json['post_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lhs_lotto_num'] = this.lhsLottoNum;
    data['cnt'] = this.cnt;
    if (this.lhsDrwNo != null) {
      data['lhs_drwNo'] = this.lhsDrwNo.map((v) => v.toJson()).toList();
    }
    data['post_content'] = this.postContent;
    return data;
  }
}

class LhsDrwNo {
  String lhsDrwtNo1;
  String lhsDrwtNo2;
  String lhsDrwtNo3;
  String lhsDrwtNo4;
  String lhsDrwtNo5;
  String lhsDrwtNo6;
  String lhsBnusNo;
  String lhsDrwNo;

  LhsDrwNo(
      {this.lhsDrwtNo1,
      this.lhsDrwtNo2,
      this.lhsDrwtNo3,
      this.lhsDrwtNo4,
      this.lhsDrwtNo5,
      this.lhsDrwtNo6,
      this.lhsBnusNo,
      this.lhsDrwNo});

  LhsDrwNo.fromJson(Map<String, dynamic> json) {
    lhsDrwtNo1 = json['lhs_drwtNo1'];
    lhsDrwtNo2 = json['lhs_drwtNo2'];
    lhsDrwtNo3 = json['lhs_drwtNo3'];
    lhsDrwtNo4 = json['lhs_drwtNo4'];
    lhsDrwtNo5 = json['lhs_drwtNo5'];
    lhsDrwtNo6 = json['lhs_drwtNo6'];
    lhsBnusNo = json['lhs_bnusNo'];
    lhsDrwNo = json['lhs_drwNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lhs_drwtNo1'] = this.lhsDrwtNo1;
    data['lhs_drwtNo2'] = this.lhsDrwtNo2;
    data['lhs_drwtNo3'] = this.lhsDrwtNo3;
    data['lhs_drwtNo4'] = this.lhsDrwtNo4;
    data['lhs_drwtNo5'] = this.lhsDrwtNo5;
    data['lhs_drwtNo6'] = this.lhsDrwtNo6;
    data['lhs_bnusNo'] = this.lhsBnusNo;
    data['lhs_drwNo'] = this.lhsDrwNo;
    return data;
  }
}
