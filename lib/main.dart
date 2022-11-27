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

class TodoListPage extends StatefulWidget{
  const TodoListPage({super.key});

  @override
  _TodoListPageState createState() => _TodoListPageState();
}
class _TodoListPageState extends State<TodoListPage>{
  List<String> todoList = [];
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:AppBar(
        title: const Text("リスト画面"),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Text(todoList[index]),
              ),
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          //pushで新規画面に遷移
          //リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              //遷移先の画面にリスト追加画面を指定
              return const ToDoAddPage();
            }),
          );
          if (newListText != null){
            //キャンセルした場合はnullになる
            setState((){
              todoList.add(newListText);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ToDoAddPage extends StatefulWidget {
  const ToDoAddPage({super.key});

  @override
  _ToDoAddPageState createState() => _ToDoAddPageState();
}

class _ToDoAddPageState extends State<ToDoAddPage>{
  String _text = '';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:  const Text("リスト追加"),
      ),
      body: Container(
        //余白を設ける
        padding : const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text, style: const TextStyle(color: Colors.blue)),
            //テキスト入力
            TextField(
              //入力されたテキストの値を受け取る
              onChanged: (String value){
                //データを変更されたため画面を更新する
                setState((){
                  //データを変更
                  _text = value;
                });
              },
            ),

            const SizedBox(height: 8),
            SizedBox(
              //横幅を最大化
              width: double.infinity,
              //リスト追加ボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: (){
                  // "pop"で前の画面に戻る
                  // "pop"の引数から前の画面にデータを渡す
                  Navigator.of(context).pop(_text);
                }
                ,
                child:  const Text('リスト追加', style: TextStyle(color : Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              //横幅最大化
              width: double.infinity,
              //キャンセルボタン
              child: TextButton(
                //ボタンを押した時の処理
                onPressed: (){
                  //popで前の画面に戻る
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
