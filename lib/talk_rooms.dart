import 'package:chat_ui/talk_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('トーク', style: titleStyle,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add_comment_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10,),
                decoration: BoxDecoration(
                  color: inputGreyLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '検索',
                          hintStyle: TextStyle(color: inputGrey,height: 1.7),
                          border: InputBorder.none,
                          isDense: true,
                          prefixIcon: Icon(Icons.search, color: inputGrey,),
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.qr_code,color: inputGrey,)),
                  ],
                )
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context,index){
                return buildRoomTile(roomList[index%5],index%5);
              },
                  childCount: 15
              )
          )
        ]
      ),
    );
  }

  Widget buildRoomTile(Map<String, dynamic> roomInfo, int roomNumber){
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(roomInfo['profileImage']),
      ),
      title: Text(roomInfo['name'],),
      subtitle: Text(roomInfo['lastMessage'], maxLines: 2, overflow: TextOverflow.ellipsis,),
      trailing: Text(roomInfo['lastUpdated'], style: const TextStyle(color: inputGrey),),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){return ChatRoom(roomNumber: roomNumber);}));
      },
    );
  }
}
