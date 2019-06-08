import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Communication Tree',
      theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
          canvasColor: Colors.white),
      home: CommunicationTree(),
    );
  }
}

class CommunicationTree extends StatefulWidget {
  @override
  CommunicationTreeState createState() => CommunicationTreeState();
}

class CommunicationTreeState extends State<CommunicationTree> {
  final _questions = List<Text>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    _questions.add(Text("How are you?", style: _biggerFont,));
    _questions.add(Text("Is it nice out today?", style: _biggerFont,));
    return Scaffold(
      appBar: AppBar(
        title: Text('Communication Tree'),
      ),
      body: _buildTree(),
    );
  }

  Widget _buildTree() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _questions.length,
      itemBuilder: (context, i){
        if(i.isOdd) return Divider();

        final index = i ~/ 2;
        return _buildRow(_questions[index]);
      },
    );
  }

  Widget _buildRow(Text question){
    return ListTile(
      title: question,
    );
  }
}
