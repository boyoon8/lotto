import 'package:lotto_dream/lhsdrwno.dart';

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
