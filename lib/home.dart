import 'package:chat_ui/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.person_add_alt,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings_outlined,color: Colors.black,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('伊藤 光弘', style: titleStyle,),
                    const SizedBox(height: 5,),
                    const Text('ステータスメッセージを入力', style: greyStyle,),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5,),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: inputGreyLight,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.music_note, color: primaryColor,),
                          Text('BGMを設定', style: TextStyle(fontSize: 12),)
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/profilePic/1.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5,),
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
                          hintText: '新着スタンプ',
                          hintStyle: TextStyle(color: inputGrey,height: 1.7),
                          border: InputBorder.none,
                          isDense: true,
                          prefixIcon: Icon(Icons.search, color: inputGrey),
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.qr_code,color: inputGrey, size: 20,)),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('友達リスト', style: boldStyle,),
                  Text('すべて見る', style: greyStyle,),
                ],
              ),
            ),
            ListTile(
              leading: LayoutBuilder(
                builder: (context, constraints) {
                  double imageRadius = constraints.maxHeight/2;
                  return CircleAvatar(
                    radius: imageRadius,
                    backgroundImage: const AssetImage('images/profilePic/5.png'),
                  );
                }
              ),
              title: const Text('誕生日が近い友達',),
              subtitle: const Text('渡辺 武', maxLines: 1, overflow: TextOverflow.ellipsis,),
              trailing: SizedBox(
                  width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [Text('1',style: greyStyle,), Icon(Icons.keyboard_arrow_right)],
                  )
              ),
              onTap: (){
              },
            ),
            ListTile(
              leading: LayoutBuilder(
                builder: (context, constraints) {
                  double maxHeight = constraints.maxHeight;
                  double imageRadius = maxHeight/2;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: maxHeight,
                      height: maxHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Image.asset('images/profilePic/1.png',width: imageRadius, height: imageRadius,fit: BoxFit.fill,),Image.asset('images/profilePic/2.png',width: imageRadius, height: imageRadius,fit: BoxFit.fill,)],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Image.asset('images/profilePic/3.png',width: imageRadius, height: imageRadius,fit: BoxFit.fill,),Image.asset('images/profilePic/4.png',width: imageRadius, height: imageRadius,fit: BoxFit.fill,)],)
                        ],
                      ),
                    ),
                  );
                }
              ),
              title: const Text('友達',),
              subtitle: const Text('田中 太郎, 吉田 花子, 鈴木 健太, 佐藤 由紀, 渡辺 武', maxLines: 1, overflow: TextOverflow.ellipsis,),
              trailing: SizedBox(
                  width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [Text('5',style: greyStyle,), Icon(Icons.keyboard_arrow_right)],
                  )
              ),
              onTap: (){
              },
            ),
            ListTile(
              leading: LayoutBuilder(
                  builder: (context, constraints) {
                    double imageRadius = constraints.maxHeight/2;
                    return CircleAvatar(
                      radius: imageRadius,
                      backgroundImage: const AssetImage('images/profilePic/2.png'),
                    );
                  }
              ),
              title: const Text('グループ',),
              subtitle: const Text('田中 太郎, 吉田 花子, 鈴木 健太, 佐藤 由紀, 渡辺 武', maxLines: 1, overflow: TextOverflow.ellipsis,),
              trailing: SizedBox(
                  width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('${roomList.length}',style: greyStyle,), const Icon(Icons.keyboard_arrow_right)],
                  )
              ),
              onTap: (){
              },
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('サービス', style: boldStyle,),
                  Text('すべて見る', style: greyStyle,),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: const [
                        Icon(Icons.emoji_emotions_outlined, size: 40, color: primaryColor,),
                        Text('スタンプ',)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: const [
                        Icon(Icons.format_paint_outlined, size: 40,color: primaryColor,),
                        Text('着せ替え',)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: const [
                        Icon(Icons.card_giftcard, size: 40,color: primaryColor,),
                        Text('ギフト',)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: const [
                        Icon(Icons.g_mobiledata, size: 40,color: primaryColor,),
                        Text('データ通信',)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: inputGreyLight,
                              width: 1,
                            ),
                          ),
                            width: 40,
                            height: 40,
                            child: const Icon(Icons.add, size: 20,)
                        ),
                        const Text('追加',)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('最新ヒット曲', style: boldStyle,),
                  Text('アプリを開く', style: greyStyle,),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 140,
              child: ListView.builder(
                  itemBuilder: (context,index){
                    return musicCard(songList[index], index);
                  },
                itemCount: songList.length,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget musicCard(Map<String, dynamic> musicInfo, int index){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 80,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Image.asset(musicInfo['profileImage'],width: 80, height: 80,),
                  Container(
                    margin: const EdgeInsets.only(left: 5, top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                      color: const Color(0x77000000),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('${index+1}', style: const TextStyle(color: Colors.white, fontSize: 12),),
                  ),
                ],
              )
          ),
          Text(musicInfo['title'],overflow: TextOverflow.ellipsis,),
          Text(musicInfo['author'], style: greyStyle,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
