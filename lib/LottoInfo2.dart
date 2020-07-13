class LottoInfo2 {
  String totSellamnt;
  String firstWinamnt;
  String firstAccumamnt;
  String firstPrzwnerCo;
  String lhsDrwtNo1;
  String lhsDrwtNo2;
  String lhsDrwtNo3;
  String lhsDrwtNo4;
  String lhsDrwtNo5;
  String lhsDrwtNo6;
  String lhsBnusNo;

  LottoInfo2(
      {this.totSellamnt,
      this.firstWinamnt,
      this.firstAccumamnt,
      this.firstPrzwnerCo,
      this.lhsDrwtNo1,
      this.lhsDrwtNo2,
      this.lhsDrwtNo3,
      this.lhsDrwtNo4,
      this.lhsDrwtNo5,
      this.lhsDrwtNo6,
      this.lhsBnusNo});

  LottoInfo2.fromJson(Map<String, dynamic> json) {
    totSellamnt = json['totSellamnt'];
    firstWinamnt = json['firstWinamnt'];
    firstAccumamnt = json['firstAccumamnt'];
    firstPrzwnerCo = json['firstPrzwnerCo'];
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
    data['totSellamnt'] = this.totSellamnt;
    data['firstWinamnt'] = this.firstWinamnt;
    data['firstAccumamnt'] = this.firstAccumamnt;
    data['firstPrzwnerCo'] = this.firstPrzwnerCo;
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
