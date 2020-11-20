import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: CustomizableSpaceBar(
              builder: (context, scrollingRate) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: 13, left: 12 + 40 * scrollingRate),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      scrollingRate.toString(),
                      style: TextStyle(fontSize: 32 - 8 * scrollingRate),
                    ),
                  ),
                );
              },
            ),
            expandedHeight: 120,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text("LIST ITEM"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
