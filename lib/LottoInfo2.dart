class LottoInfo2 {
  String totSellamnt;
  String firstWinamnt;
  String firstAccumamnt;
  String firstPrzwnerCo;

  LottoInfo2(
      {this.totSellamnt,
      this.firstWinamnt,
      this.firstAccumamnt,
      this.firstPrzwnerCo});

  LottoInfo2.fromJson(Map<String, dynamic> json) {
    totSellamnt = json['totSellamnt'];
    firstWinamnt = json['firstWinamnt'];
    firstAccumamnt = json['firstAccumamnt'];
    firstPrzwnerCo = json['firstPrzwnerCo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totSellamnt'] = this.totSellamnt;
    data['firstWinamnt'] = this.firstWinamnt;
    data['firstAccumamnt'] = this.firstAccumamnt;
    data['firstPrzwnerCo'] = this.firstPrzwnerCo;
    return data;
  }
}
