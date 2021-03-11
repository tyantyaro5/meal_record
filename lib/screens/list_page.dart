import 'package:flutter/material.dart';
import 'package:meal_record/db/database.dart';
import 'package:toast/toast.dart';

import '../main.dart';
import 'edit_screen.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Word> _wordList = List();

  @override
  void initState() {
    super.initState();
    _getAllWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("食べた物一覧"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: _wordList.length,
          itemBuilder: (context, int position) => _wordItem(position)),
    );
  }

  void _getAllWords() async {
    _wordList = await database.allWords;
    setState(() {});
  }

  Widget _wordItem(int position) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text("${_wordList[position].toDay}"),
        subtitle: Text(
          "${_wordList[position].strMorning}",
        ),
        onTap: () => _editWord(_wordList[position]),
        onLongPress: () => _deleteWord(_wordList[position]),
      ),
    );
  }

  _deleteWord(Word selectedWord) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text(selectedWord.toDay),
          content: Text("削除してもいいですか？"),
          actions: <Widget>[
            TextButton(
              child: Text("はい"),
              onPressed: () async {
                await database.deleteWord(selectedWord);
                Toast.show("削除が完了しました", context);
                _getAllWords();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ));
  }

  _editWord(Word selectedWord) async{
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditScreen(
              status: EditStatus.LIST,
              word: selectedWord,
            )));
  }
  }
