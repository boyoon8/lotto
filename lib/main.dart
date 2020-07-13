import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lotto_dream/firebase.dart';
import 'package:lotto_dream/lottoconfig.dart';
import 'package:lotto_dream/data.dart';
import 'package:lotto_dream/lottodata.dart';
import 'package:lotto_dream/msg.dart';
import 'package:lotto_dream/subpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(new Directory());

class Directory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로또해몽',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        cursorColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
  // TabController controller;

  static const _adUnitID = "ca-app-pub-3512587290196762/4432298596";

  // static const _adUnitID = "ca-app-pub-3940256099942544/2247696110"; //테스트 아이디

  final _controller = NativeAdmobController();
  final _randomizer = new Random(); // can get a seed as a parameter
  FirebaseAdMobManager adMob = FirebaseAdMobManager();
  bool _visible = false;
  // double _height = 0;
  // StreamSubscription _subscription;
  List<Data> listItems = [];
  var items = List<Data>();

  List<Lhs> configItems = [];
  var cItems = List<Lhs>();

  List<String> keywordItems = [];
  var kItems = List<String>();

  String title = '최근에 감명 깊은 꿈을 꾸었나요?';
  String title1 = '꿈 내용을 입력해 주세요';
  String title2 = '명사 위주로 입력해주세요';
  String title3 = '조사는 입력 안하셔도 됩니다';
  String title4 = '혹은 로또 번호 입력해 보세요';
  String title5 = '띄어 쓰기로 구분하시면 좋습니다';
  String hinttext = '꿈내용 또는 로또숫자를 입력하세요';
  Hinttext2 hinttext2 = null;
  // Hinttext2 hinttext3 = null;
  Keyword keyword = null;
  int admobisdispaly1 = 1;
  int admobisdispaly2 = 1;
  int admobrandispaly1 = 10;
  int admobrandispaly2 = 10;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<LottoConfig> fetchConfig() async {
    var res = await http.get('http://lotto.dbpopcon.com/search/config');

    LottoConfig result = LottoConfig.fromJson(json.decode(res.body));

    return result;
  }

  Future<LottoData> fetchData() async {
    var res = await http.get('http://lotto.dbpopcon.com/search');

    LottoData result = LottoData.fromJson(json.decode(res.body));
    result.data.forEach((element) {
      this.listItems.add(element);
    });
    items.addAll(listItems);

    return result;
  }

  @override
  void initState() {
    // _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    super.initState();
    // controller = new TabController(length: 4, vsync: this);
    fetchConfig().then((lottoResult) {
      this.title1 = lottoResult.title1;
      this.title2 = lottoResult.title2;
      this.title3 = lottoResult.title3;
      this.title4 = lottoResult.title4;
      this.hinttext = lottoResult.hinttext;
      this.hinttext2 = lottoResult.hinttext2;
      // this.hinttext3 = lottoResult.hinttext3;
      this.keyword = lottoResult.keyword;
      this.admobisdispaly1 = lottoResult.admobisdispaly1;
      this.admobisdispaly2 = lottoResult.admobisdispaly2;
      this.admobrandispaly1 = lottoResult.admobrandispaly1;
      this.admobrandispaly2 = lottoResult.admobrandispaly2;
      setState(() {
        this._visible = !this._visible;
      });

      // scaffoldKey.currentState
      // .showSnackBar(SnackBar(content: Text("SnackBarTest4 - 1")));

      this.hinttext2.lhs.forEach((element) {
        this.configItems.add(element);
      });

      this.keyword.keyword.forEach((element) {
        this.keywordItems.add(element);
      });
    });
    adMob.init();
  }

  @override
  void dispose() {
    adMob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this._visible)
      return Scaffold(
        key: scaffoldKey, // 발급한 키를 Scaffold에 등록
        body: new Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                header(),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: TextField(
                                // onTap: () {
                                //   showSnackbarWithKey();
                                // },
                                onChanged: (value) {
                                  filterSearchResults(
                                      value); // passing the getting value
                                  // print('vaue :' + value);
                                }, //

                                controller:
                                    editingController, //still I'm  not using
                                onSubmitted: _handleSubmitted,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // prefixIcon: Icon(Icons.search,
                                  //     color: Color(0xFFE511E5), size: 25.0),
                                  contentPadding:
                                      EdgeInsets.only(left: 5, top: 0),
                                  hintText: '${this.hinttext}',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: RaisedButton(
                                padding: EdgeInsets.all(-2),
                                child: Icon(Icons.search),
                                color: Colors.blueGrey,
                                textColor: Colors.white,
                                onPressed: () {
                                  if (_randomizer
                                          .nextInt(this.admobrandispaly1) ==
                                      1) adMob.showInterstitialAd();
                                  scaffoldKey.currentState
                                      .hideCurrentSnackBar();
                                  return _handleSubmitted(
                                      editingController.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Text(
                      '최신 인기 검색어',
                      style: TextStyle(fontFamily: 'Quicksand', fontSize: 18.0),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          MaterialButton(
                            height: 30,
                            minWidth: 10,
                            child: Text('${this.keywordItems[0]}'),
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              editingController.text = this.keywordItems[0];
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          MaterialButton(
                            height: 30,
                            minWidth: 10,
                            child: Text('${this.keywordItems[1]}'),
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              editingController.text = this.keywordItems[1];
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          MaterialButton(
                            height: 30,
                            minWidth: 10,
                            child: Text('${this.keywordItems[2]}'),
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              editingController.text = this.keywordItems[2];
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          MaterialButton(
                            height: 30,
                            minWidth: 10,
                            child: Text('${this.keywordItems[3]}'),
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              editingController.text = this.keywordItems[3];
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          MaterialButton(
                            height: 30,
                            minWidth: 10,
                            child: Text('${this.keywordItems[4]}'),
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              editingController.text = this.keywordItems[4];
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (items.length < 1 || editingController.text == '')
              new Expanded(
                  child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('최근 당첨 번호', style: TextStyle(fontSize: 25)),
                  new Expanded(
                    child: ListView.separated(
                      // padding: const EdgeInsets.only(top: 20, bottom: 20),
                      // padding: const EdgeInsets.only(top: 20, bottom: 20),
                      itemCount: configItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 40,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                configItems[index].lhsDrwNo + '회 : ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                configItems[index]
                                    .lhsDrwtNo, // You need to pass the string you want the highlights

                                style: TextStyle(
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
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ],
              ))
            else
              new Expanded(
                child: new ListView.builder(
                  itemCount: items.length, //count the value no in the list
                  itemBuilder: (BuildContext ctxt, int index) {
                    if ((index % 5) == 2) {
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: SizedBox(
                            height: 180,
                            child: Card(
                              elevation: 4,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: NativeAdmob(
                                  // Your ad unit id
                                  adUnitID: _adUnitID,
                                  controller: _controller,
                                  type: NativeAdmobType.full,
                                ),
                              ),
                            ),
                          ),
                        ),
                        _buildCell(context, index, items[index]),
                      ]);
                    } else
                      return _buildCell(context, index, items[index]);
                  },
                ),
              ),
          ],
        ),
      );
    else
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.cyan,
            strokeWidth: 5,
          ),
        ),
      );
  }

  void filterSearchResults(val) {
    if (val == '') {
      setState(() {
        editingController.clear();
      });
    }
  } //Now using

  Widget header() {
    return new Container(
        height: 140.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            SizedBox(
              child: ColorizeAnimatedTextKit(
                  text: [
                    "${this.title}",
                    "${this.title1}",
                    "${this.title2}",
                    "${this.title3}",
                    "${this.title4}",
                    "${this.title5}",
                  ],
                  textStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand"),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  repeatForever: true,
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
          ],
        ));
  }

  Widget _buildCell(
    BuildContext context,
    int index,
    Data lottoData,
  ) {
    // same as previous video
    return Padding(
      padding: EdgeInsets.all(0),
      child: SizedBox(
        child: Card(
          elevation: 4,
          color: Colors.lightBlue,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width /
                          6, //full width get the 6 part
                      height: MediaQuery.of(context).size.width / 6,

                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${lottoData.lhsLottoNum}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '총',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${lottoData.cnt} 회',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '당첨',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 5.0),
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          lottoData.postContent,
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Center(
                        child: FlatButton(
                          child: Text('당첨 회차 보러가기'),
                          color: Colors.orange,
                          textColor: Colors.black,
                          onPressed: () {
                            if (_randomizer.nextInt(this.admobrandispaly1) == 1)
                              adMob.showInterstitialAd();
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubPage(
                                      lotto: lottoData.lhsDrwNo,
                                      lottoNum: lottoData.lhsLottoNum)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(String value) async {
    var url = 'http://lotto.dbpopcon.com/search';
    var response = await http.post(
      url,
      body: {
        'skeyword': value,
      },
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 406) {
      Msg result = Msg.fromJson(json.decode(response.body));

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text('알림'),
            content: new Text(result.msg),
            actions: <Widget>[
              new FlatButton(
                child: new Text("닫기"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      LottoData result = LottoData.fromJson(json.decode(response.body));
      listItems.clear();
      FocusScope.of(context).unfocus();
      result.data.forEach((element) {
        this.listItems.add(element);
      });

      setState(() {
        items.clear();
        items.addAll(listItems);
      });
    }
  }

  showSnackbarWithKey() {
    // 키를 통해 Scaffold에 접근하여 스낵바 출력
    scaffoldKey.currentState.showSnackBar(SnackBar(
        // duration: Duration(days: 1),
        content: Text("${this.keyword}", style: TextStyle(fontSize: 20))));
  }
}

// class SnackbarManager {
//   static void showSnackBar(
//       GlobalKey<ScaffoldState> scaffoldKey, String message) {
//     scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
//   }
// }

//lets take a look on the whole code
