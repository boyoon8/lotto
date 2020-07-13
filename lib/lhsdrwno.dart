class LhsDrwNo {
  String drwtNo;
  String drwNo;

  LhsDrwNo({this.drwtNo, this.drwNo});

  LhsDrwNo.fromJson(Map<String, dynamic> json) {
    drwtNo = json['drwtNo'];
    drwNo = json['drwNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drwtNo'] = this.drwtNo;
    data['drwNo'] = this.drwNo;
    return data;
  }
}
