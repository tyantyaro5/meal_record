import 'package:flutter/material.dart';
import 'package:meal_record/db/database.dart';
import 'package:moor/ffi.dart';
import 'package:toast/toast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../main.dart';

enum EditStatus { TODAY, CALENDAR, LIST}

class EditScreen extends StatefulWidget {
  final EditStatus status;
  final Word word;

  EditScreen({@required this.status, this.word});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController dayController = TextEditingController();
  TextEditingController morningController = TextEditingController();
  TextEditingController noonController = TextEditingController();
  TextEditingController snackController = TextEditingController();
  TextEditingController nightController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  String _dateTimeNow = getTodayDate();
  String _titleText = "";

  @override
  void initState() {
    super.initState();
    if (widget.status == EditStatus.TODAY) {
      _titleText = ("今日食べた物を入力");
      dayController.text = _dateTimeNow;
      morningController.text = "";
      noonController.text = "";
      snackController.text = "";
      nightController.text = "";
      memoController.text = "";
    } if (widget.status == EditStatus.LIST) {
      _titleText = ("食べた物を編集する");
      dayController.text = widget.word.toDay;
      morningController.text = widget.word.strMorning;
      noonController.text = widget.word.strNoon;
      snackController.text = widget.word.strSnack;
      nightController.text = widget.word.strNight;
      memoController.text = widget.word.strMemo;
    } else {
      _titleText = ("食べた物を編集する");
      dayController.text = _dateTimeNow;
      morningController.text = "";
      noonController.text = "";
      snackController.text = "";
      nightController.text = "";
      memoController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titleText),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.done),
                tooltip: "登録",
                onPressed: () => _registratedWord()),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _dayInput(),
              SizedBox(
                height: 20,
              ),
              _morningInput(),
              SizedBox(
                height: 20,
              ),
              _noonInput(),
              SizedBox(height: 20,),
              _snackInput(),
              SizedBox(height: 20,),
              _nightInput(),
              SizedBox(height: 20,),
              _memoInput(),
            ],
          ),
        ),
      ),
    );
  }

  _registratedWord() {
    if (widget.status == EditStatus.TODAY) {
      _insertWord();
    } else {
      _updateWord();
    }
  }

  _insertWord() async {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("登録"),
              content: Text("登録して良いですか？"),
              actions: [
                TextButton(
                  child: Text("はい"),
                  onPressed: () {
                    var word = Word(
                      toDay: dayController.text,
                      strMorning: morningController.text,
                      strNoon: noonController.text,
                      strSnack: snackController.text,
                      strNight: nightController.text,
                      strMemo: memoController.text,
                    );
                    try {
                      database.addWord(word);
                      print("OK");
                      dayController.clear();
                      morningController.clear();
                      noonController.clear();
                      snackController.clear();
                      nightController.clear();
                      memoController.clear();
                      Toast.show("登録が完了しました。", context,
                          duration: Toast.LENGTH_LONG);
                    } on SqliteException catch (e) {
                      print(e.toString());
                    } finally {
                      Navigator.pop(context);
                    }
                  },
                ),
                TextButton(
                  child: Text("いいえ"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  }

  void _updateWord() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text("食べた物を変更"),
                content: Text("変更しても良いですか？"),
                actions: [
                  TextButton(
                    child: Text("はい"),
                    onPressed: () {
                      var word = Word(
                        toDay: dayController.text,
                        strMorning: morningController.text,
                        strNoon: noonController.text,
                        strSnack: snackController.text,
                        strNight: nightController.text,
                        strMemo: memoController.text,
                      );
                      try {
                        database.updateWord(word);
                        Navigator.pop(context);
                        Toast.show("修正が完了しました。", context,
                            duration: Toast.LENGTH_LONG);
                      } on SqliteException catch (e) {
                        Toast.show("何らかの問題が発生した為登録できませんでした。: $e", context,
                            duration: Toast.LENGTH_LONG);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  TextButton(
                      child: Text("いいえ"),
                      onPressed: () => Navigator.pop(context))
                ]));
  }

  Widget _dayInput() {
    return Container(
      width: 100,
      child: TextField(
        controller: dayController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "日付を入力"
        ),
      ),
    );
  }

  Widget _morningInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("朝食", style: TextStyle(fontSize: 20),),
          SizedBox(width: 20,),
          Container(
            width: 300,
            child: TextField(
              controller: morningController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  Widget _noonInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("昼食", style: TextStyle(fontSize: 20),),
          SizedBox(width: 20,),
          Container(
            width: 300,
            child: TextField(
              controller: noonController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  Widget _snackInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("間食", style: TextStyle(fontSize: 20),),
          SizedBox(width: 20,),
          Container(
            width: 300,
            child: TextField(
              controller: snackController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  Widget _nightInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("夕食", style: TextStyle(fontSize: 20),),
          SizedBox(width: 20,),
          Container(
            width: 300,
            child: TextField(
              controller: nightController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  Widget _memoInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("メモ", style: TextStyle(fontSize: 20),),
          SizedBox(width: 20,),
          Container(
            width: 300,
            child: TextField(
              controller: memoController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  static String getTodayDate() {
      initializeDateFormatting('ja');
      return DateFormat.yMMMd('ja').format(DateTime.now()).toString();
    }
  }