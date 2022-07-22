import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Japan Food FC';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: 
              _cardDetail(),
            );
           }),
                      
          ),
        ),
      );
  }
}
 
  _cardDetail() {
    final card = Container(
      child: Column(
        children: <Widget>[
          Image.network('https://www.gamingscan.com/wp-content/uploads/2022/01/Xingqiu-Build-Guide-For-Genshin-Impact.jpg'),
          //Image.asset('assets/images/Youtube water.png'),      
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Name'),
          ),
          TextButton(onPressed: () {}, child: Text('More Detail'))
        ],
    ));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)),
        ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: card,
      ),
    );
  }

