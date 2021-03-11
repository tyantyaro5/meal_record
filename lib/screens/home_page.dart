import 'package:flutter/material.dart';

import 'edit_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        tooltip: "今日食べた物を入力",
        onPressed: () => _addNewWord(),
        child: Icon(Icons.create, color: Colors.white,),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/52308434.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                indent: 8,
                endIndent: 8,
                color: Colors.black54,
                thickness: 2,
              ),
              Center(child: Text("シンプルな",style: TextStyle(fontSize: 45, color: Colors.black, fontFamily: "Bold"),)),
              Center(child: Text("食事記録", style: TextStyle(fontSize: 45, color: Colors.black, fontFamily: "Bold"),)),
              Divider(
                indent: 8,
                endIndent: 8,
                color: Colors.black54,
                thickness: 2,
              )
            ],
          )
        ],
      ),
    );
  }

  _addNewWord() async{
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditScreen(
              status: EditStatus.TODAY,
            )));
  }
}
