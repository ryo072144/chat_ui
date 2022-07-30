import 'package:chat_ui/constants.dart';
import 'package:flutter/material.dart';


class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key, required this.roomNumber}) : super(key: key);
  final int roomNumber;

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  bool isTyping = false;
  TextEditingController messageEditingController = TextEditingController();
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roomList[widget.roomNumber]['name']),
        backgroundColor: chatBlue,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.phone_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
        ],
      ),
      backgroundColor: chatBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: ListView.builder(
                controller: listScrollController,
                itemCount: messageList.length,
                  itemBuilder: (context,index){
                    return buildMessageTile(messageList[index]);
                  }
              )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                //IconButtonは余白が大きすぎるので、普通のIconにGestureDetectorを被せてボタンにしています。
                GestureDetector(
                  onTap: (){},
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.add,color: Colors.black,),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.image_outlined,color: Colors.black,),
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10,),
                      decoration: BoxDecoration(
                        color: inputGreyLight,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: inputGrey, fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                              minLines: 1,
                              maxLines: 5,
                              onChanged: (text){
                                if(text!=''){
                                  setState(() {
                                    isTyping = true;
                                  });
                                }else{
                                  setState(() {
                                    isTyping = false;
                                  });
                                }
                              },
                              controller: messageEditingController,
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.emoji_emotions_outlined,color: inputGrey,)),
                        ],
                      )
                  ),
                ),
                isTyping?IconButton(onPressed: (){
                  setState(() {
                    messageList.add({
                      'message': messageEditingController.text,
                      'userId': 'user2',
                      'time': '4:20',
                    },);
                    messageEditingController.clear();
                    isTyping = false;
                  });
                  listScrollController.animateTo(listScrollController.position.maxScrollExtent, duration: const Duration(microseconds: 500), curve: Curves.easeIn);
                }, icon: const Icon(Icons.send,color: Colors.blueAccent,))
                    :IconButton(onPressed: (){}, icon: const Icon(Icons.mic_none,color: Colors.black,)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessageTile(Map<String, dynamic> messageInfo){

    double width = MediaQuery.of(context).size.width;

    return messageInfo['userId']=='user2'?IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(messageInfo['time'], style: const TextStyle(color: Colors.black54, fontSize: 12),)
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(messageInfo['message'],overflow: TextOverflow.clip,),
            ),
          ),
        ],
      ),
    ):IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(roomList[widget.roomNumber]['profileImage']),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(messageInfo['message'],),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(bottom: 10),
                child: Text(messageInfo['time'], style: const TextStyle(color: Colors.black54, fontSize: 12),)
            ),
          ),
        ],
      ),
    );
  }
}