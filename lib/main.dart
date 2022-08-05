import 'package:chat_ui/constants.dart';
import 'package:chat_ui/home.dart';
import 'package:flutter/material.dart';
import 'talk_rooms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,//アプリ右上に表示されるDebugの文字を消します。
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: titleStyle,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pageOptions = <Widget>[
    const Home(),
    const Rooms(),
    const Center(child: Text('blank'),),
    const Center(child: Text('blank'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'ホーム',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'トーク',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'ニュース',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'ウォレット',
          ),
        ],
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
