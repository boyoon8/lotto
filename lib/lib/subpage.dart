import 'package:flutter/material.dart';

import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:lotto_dream/lottodata.dart';

class SubPage extends StatelessWidget {
  final List<LhsDrwNo> lotto;
  final int lottoNum;

  const SubPage({Key key, this.lotto, this.lottoNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const _adUnitID = "ca-app-pub-3512587290196762/4432298596";
    const _adUnitID = "ca-app-pub-3940256099942544/2247696110"; // test id

    final _controller = NativeAdmobController();
    return Scaffold(
      appBar: AppBar(
        title: Text('로또 번호 ${this.lottoNum}번 당첨 회차 리스트'),
      ),
      body: ListView.separated(
        // padding: const EdgeInsets.only(top: 20, bottom: 20),
        // padding: const EdgeInsets.only(top: 20, bottom: 20),
        itemCount: lotto.length,
        itemBuilder: (BuildContext context, int index) {
          if ((index % 12) == 2) {
            return Column(children: [
              Container(
                height: 150,
                color: Colors.white,
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: _adUnitID,
                  controller: _controller,
                  type: NativeAdmobType.full,
                ),
              ),
              Container(
                height: 60,
                color: (index % 3 == 1)
                    ? Color.fromRGBO(220, 220, 220, 1)
                    : Colors.white,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      lotto[index].lhsDrwNo + '회 : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lotto[index].lhsDrwtNo1}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: lottoNum == int.parse(lotto[index].lhsDrwtNo1)
                              ? Colors.red
                              : Colors.black,
                          style: BorderStyle.solid,
                          width: lottoNum == int.parse(lotto[index].lhsDrwtNo1)
                              ? 3.0
                              : 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: _aaaa(lotto[index].lhsDrwtNo1),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      width: 30,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lotto[index].lhsDrwtNo2}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: lottoNum == int.parse(lotto[index].lhsDrwtNo2)
                              ? Colors.red
                              : Colors.black,
                          style: BorderStyle.solid,
                          width: lottoNum == int.parse(lotto[index].lhsDrwtNo2)
                              ? 3.0
                              : 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: _aaaa(lotto[index].lhsDrwtNo2),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      width: 30,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lotto[index].lhsDrwtNo3}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: lottoNum == int.parse(lotto[index].lhsDrwtNo3)
                              ? Colors.red
                              : Colors.black,
                          style: BorderStyle.solid,
                          width: lottoNum == int.parse(lotto[index].lhsDrwtNo3)
                              ? 3.0
                              : 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: _aaaa(lotto[index].lhsDrwtNo3),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      width: 30,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lotto[index].lhsDrwtNo4}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: lottoNum == int.parse(lotto[index].lhsDrwtNo4)
                              ? Colors.red
                              : Colors.black,
                          style: BorderStyle.solid,
                          width: lottoNum == int.parse(lotto[index].lhsDrwtNo4)
                              ? 3.0
                              : 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: _aaaa(lotto[index].lhsDrwtNo4),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      width: 30,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lotto[index].lhsDrwtNo5}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: lottoNum == int.parse(lotto[index].lhsDrwtNo5)
                              ? Colors.red
                              : Colors.black,
                          style: BorderStyle.solid,
                          width: lottoNum == int.parse(lotto[index].lhsDrwtNo5)
                              ? 3.0
                              : 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: _aaaa(lotto[index].lhsDrwtNo5),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      width: 30,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lotto[index].lhsDrwtNo6}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: lottoNum == int.parse(lotto[index].lhsDrwtNo6)
                              ? Colors.red
                              : Colors.black,
                          style: BorderStyle.solid,
                          width: lottoNum == int.parse(lotto[index].lhsDrwtNo6)
                              ? 3.0
                              : 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: _aaaa(lotto[index].lhsDrwtNo6),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      width: 30,
                      height: 30,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lotto[index].lhsBnusNo}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: lottoNum == int.parse(lotto[index].lhsBnusNo)
                              ? Colors.red
                              : Colors.black,
                          style: BorderStyle.solid,
                          width: lottoNum == int.parse(lotto[index].lhsBnusNo)
                              ? 3.0
                              : 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: _aaaa(lotto[index].lhsBnusNo),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          } else {
            return Container(
              height: 60,
              color: (index % 3 == 1)
                  ? Color.fromRGBO(220, 220, 220, 1)
                  : Colors.white,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    lotto[index].lhsDrwNo + '회 : ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lotto[index].lhsDrwtNo1}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                        color: lottoNum == int.parse(lotto[index].lhsDrwtNo1)
                            ? Colors.red
                            : Colors.black,
                        style: BorderStyle.solid,
                        width: lottoNum == int.parse(lotto[index].lhsDrwtNo1)
                            ? 3.0
                            : 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: _aaaa(lotto[index].lhsDrwtNo1),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Container(
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lotto[index].lhsDrwtNo2}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                        color: lottoNum == int.parse(lotto[index].lhsDrwtNo2)
                            ? Colors.red
                            : Colors.black,
                        style: BorderStyle.solid,
                        width: lottoNum == int.parse(lotto[index].lhsDrwtNo2)
                            ? 3.0
                            : 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: _aaaa(lotto[index].lhsDrwtNo2),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Container(
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lotto[index].lhsDrwtNo3}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                        color: lottoNum == int.parse(lotto[index].lhsDrwtNo3)
                            ? Colors.red
                            : Colors.black,
                        style: BorderStyle.solid,
                        width: lottoNum == int.parse(lotto[index].lhsDrwtNo3)
                            ? 3.0
                            : 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: _aaaa(lotto[index].lhsDrwtNo3),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Container(
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lotto[index].lhsDrwtNo4}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                        color: lottoNum == int.parse(lotto[index].lhsDrwtNo4)
                            ? Colors.red
                            : Colors.black,
                        style: BorderStyle.solid,
                        width: lottoNum == int.parse(lotto[index].lhsDrwtNo4)
                            ? 3.0
                            : 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: _aaaa(lotto[index].lhsDrwtNo4),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Container(
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lotto[index].lhsDrwtNo5}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                        color: lottoNum == int.parse(lotto[index].lhsDrwtNo5)
                            ? Colors.red
                            : Colors.black,
                        style: BorderStyle.solid,
                        width: lottoNum == int.parse(lotto[index].lhsDrwtNo5)
                            ? 3.0
                            : 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: _aaaa(lotto[index].lhsDrwtNo5),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Container(
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lotto[index].lhsDrwtNo6}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                        color: lottoNum == int.parse(lotto[index].lhsDrwtNo6)
                            ? Colors.red
                            : Colors.black,
                        style: BorderStyle.solid,
                        width: lottoNum == int.parse(lotto[index].lhsDrwtNo6)
                            ? 3.0
                            : 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: _aaaa(lotto[index].lhsDrwtNo6),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    '+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Container(
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lotto[index].lhsBnusNo}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      border: Border.all(
                        color: lottoNum == int.parse(lotto[index].lhsBnusNo)
                            ? Colors.red
                            : Colors.black,
                        style: BorderStyle.solid,
                        width: lottoNum == int.parse(lotto[index].lhsBnusNo)
                            ? 3.0
                            : 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: _aaaa(lotto[index].lhsBnusNo),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  _aaaa(String val) {
    if (int.parse(val) < 11)
      return [Colors.yellow[700], Colors.yellow[700]];
    else if (int.parse(val) < 21)
      return [Colors.blue[800], Colors.blue[800]];
    else if (int.parse(val) < 31)
      return [Colors.red[800], Colors.red[800]];
    else if (int.parse(val) < 41)
      return [Colors.black, Colors.black];
    else
      return [Colors.green[800], Colors.green[800]];
  }
}
