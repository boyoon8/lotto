import 'package:flutter/material.dart';
import 'package:lotto_dream/lhsdrwno.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class SubPage extends StatelessWidget {
  final List<LhsDrwNo> lotto;
  final int lottoNum;

  const SubPage({Key key, this.lotto, this.lottoNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, HighlightedWord> words = {
      "${this.lottoNum}": HighlightedWord(
        onTap: () {
          print("Flutter");
        },
        textStyle: TextStyle(
          color: Colors.blue,
          fontSize: 22.0,
        ),
      ),
      "(${this.lottoNum})": HighlightedWord(
        onTap: () {
          print("Flutter");
        },
        textStyle: TextStyle(
          color: Colors.blue,
          fontSize: 22.0,
        ),
      ),
    };

    HighlightMap highlightMap = HighlightMap(words);
    const _adUnitID = "ca-app-pub-3512587290196762/4432298596";
    // const _adUnitID = "ca-app-pub-3940256099942544/2247696110"; // test id

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
                      lotto[index].drwNo + ' : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextHighlight(
                      text: lotto[index]
                          .drwtNo, // You need to pass the string you want the highlights
                      words: highlightMap.getMap, // Your dictionary words
                      textStyle: TextStyle(
                          // You can set the general style, like a Text()
                          fontSize: 20.0,
                          color: Colors.black,
                          wordSpacing: 4.0),
                      textAlign: TextAlign
                          .justify, // You can use any attribute of the RichText widget
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
                    lotto[index].drwNo + ' : ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextHighlight(
                    text: lotto[index]
                        .drwtNo, // You need to pass the string you want the highlights
                    words: highlightMap.getMap, // Your dictionary words
                    textStyle: TextStyle(
                        // You can set the general style, like a Text()
                        fontSize: 20.0,
                        color: Colors.black,
                        wordSpacing: 4.0),
                    textAlign: TextAlign
                        .justify, // You can use any attribute of the RichText widget
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
}
