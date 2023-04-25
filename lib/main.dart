import 'package:flutter/material.dart';
import 'card2.dart';
import 'card1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum CardState {
  Card1,
  Card2,
}

class _MyHomePageState extends State<MyHomePage> {
  CardState _cardState = CardState.Card1;







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Visibility(
                visible: _cardState == CardState.Card1,
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    setState(() {
                      _cardState = CardState.Card2;
                    });
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return const Card1();
                    },
                  ),
                ),
              ),
              Visibility(
                visible: _cardState == CardState.Card2,
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    setState(() {
                      _cardState = CardState.Card1;
                    });
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Card2();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
