class Lotto_info {
  List<Info> info;

  Lotto_info({this.info});

  Lotto_info.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = new List<Info>();
      json['info'].forEach((v) {
        info.add(new Info.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String lhsDrwNo;
  String lhsDrwNoDate;

  Info({this.lhsDrwNo, this.lhsDrwNoDate});

  Info.fromJson(Map<String, dynamic> json) {
    lhsDrwNo = json['lhs_drwNo'];
    lhsDrwNoDate = json['lhs_drwNoDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lhs_drwNo'] = this.lhsDrwNo;
    data['lhs_drwNoDate'] = this.lhsDrwNoDate;
    return data;
  }
}
