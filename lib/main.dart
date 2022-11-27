import 'package:flutter/material.dart';

void main(){
  runApp(const MyToDoApp());
}

class MyToDoApp extends StatelessWidget{
  const MyToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //アプリ名
      title: 'MyToDoApp',
      theme: ThemeData(
        //テーマカラー
        primarySwatch: Colors.blue,
      ),
     //リスト一覧画面を表示
     home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatelessWidget{
  const TodoListPage({super.key});
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:AppBar(
        title: const Text("リスト画面"),
      ),
      body: ListView(
        children: const <Widget>[
          //cardとlistTileで整ったUIを生成
          Card(
            child :  ListTile(
              title: Text('にんじん'),
            ),
          ),
          Card(
            child :  ListTile(
              title: Text('りんご'),
            ),
          ),
          Card(
            child :  ListTile(
              title: Text('みかん'),
            ),
          ),
          Card(
            child :  ListTile(
              title: Text('おかし'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //pushで新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              //遷移先の画面にリスト追加画面を指定
              return const ToDoAddPage();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ToDoAddPage extends StatelessWidget{
  const ToDoAddPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text("リスト追加"),
      ),
      body: Container(
        //余白を設ける
        padding : EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //テキスト入力
            TextField(),
            const SizedBox(height: 8),
            Container(
              //横幅を最大化
              width: double.infinity,
              //リスト追加ボタン
            )
          ],
        ),
      ),
    );
  }

}
