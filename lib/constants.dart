import 'package:flutter/material.dart';

//色
const Color primaryColor = Color(0xff06c755);
const Color inputGrey = Color(0xffaaaaaa);
const Color inputGreyLight = Color(0xfff0f0f0);
const Color chatBlue = Color(0xff7292C1);

//テキストスタイル
const TextStyle titleStyle = TextStyle(color: Colors.black, fontSize: 22 ,fontWeight: FontWeight.bold);
const TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);
const TextStyle greyStyle = TextStyle(color: inputGrey);

//トークルームのリスト。Firestoreのドキュメントと同じMap<String, dynamic>型で定義。
List<Map<String, dynamic>> roomList = [
  {
    'name': '田中 太郎',
    'profileImage': 'images/profilePic/1.png',
    'lastMessage': 'よろしくお願いします',
    'lastUpdated': '4/20'
  },
  {
    'name': '吉田 花子',
    'profileImage': 'images/profilePic/2.png',
    'lastMessage': 'こんにちは！',
    'lastUpdated': '4/20'
  },
  {
    'name': '鈴木 健太',
    'profileImage': 'images/profilePic/3.png',
    'lastMessage': '初めまして！',
    'lastUpdated': '4/20'
  },
  {
    'name': '佐藤 由紀',
    'profileImage': 'images/profilePic/4.png',
    'lastMessage': '賄い付き下宿として運営されているこの館はヴォーケ夫人が所有していた。館はネーヴ・サント・ジュヌヴィエーヴ通りの低地にあったが、この場所がラルバレート通り辺りから急な荒れた坂を下った所になるので、馬がここを上がったり下がったりすることは余りなかった。',
    'lastUpdated': '4/20'
  },
  {
    'name': '渡辺 武',
    'profileImage': 'images/profilePic/5.png',
    'lastMessage': 'How are you?',
    'lastUpdated': '4/20'
  },
];

List<Map<String, dynamic>> messageList =[
  {
    'message': 'こんにちは！',
    'userId': 'user1',
    'time': '4:20',
  },
  {
    'message': 'こんにちは！',
    'userId': 'user2',
    'time': '4:20',
  },
  {
    'message': '賄い付き下宿として運営されているこの館はヴォーケ夫人が所有していた。館はネーヴ・サント・ジュヌヴィエーヴ通りの低地にあったが、この場所がラルバレート通り辺りから急な荒れた坂を下った所になるので、馬がここを上がったり下がったりすることは余りなかった。',
    'userId': 'user1',
    'time': '4:20',
  },
  {
    'message': 'こんにちは！',
    'userId': 'user1',
    'time': '4:20',
  },
];

List<Map<String, dynamic>> songList = [
  {
    'title': 'Song1',
    'profileImage': 'images/profilePic/1.png',
    'author': '田中 太郎',
  },
  {
    'title': 'Song2',
    'profileImage': 'images/profilePic/2.png',
    'author': '吉田 花子',
  },
  {
    'title': 'Song3',
    'profileImage': 'images/profilePic/3.png',
    'author': '鈴木 健太',
  },
  {
    'title': 'Song4',
    'profileImage': 'images/profilePic/4.png',
    'author': '佐藤 由紀',
  },
  {
    'title': 'Song5',
    'profileImage': 'images/profilePic/5.png',
    'author': '渡辺 武',
  },
];