import 'package:flutter/material.dart';
import 'package:whatsapp/callscreen.dart';
import 'package:whatsapp/dashboard.dart';
import 'package:whatsapp/updatesscreen.dart';

class communitiesScreen extends StatefulWidget {
  const communitiesScreen({super.key});

  @override
  State<communitiesScreen> createState() => _communitiesScreenState();
}

class _communitiesScreenState extends State<communitiesScreen> {
  int _currentPage = 2;
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(backgroundColor: Colors.teal[600],
            title: Text('WhatsApp',style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),),
            actions: [
              Row(children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined)),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    print('Selected: $value');
                  },
                  offset: Offset(0,50),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Option 2',
                      child: Text('Settings'),
                    ),
                  ],)],),
            ]),
    body: Column(children: [
      SizedBox(height: 10),
      Row(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(15)),height: 50,width: 50,
            child: Icon(Icons.groups,color: Colors.white,)),
      ),
      SizedBox(width: 20),
      Text('New Community',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)],),
      SizedBox(height: 10),
      Divider(color: Colors.grey[100],thickness: 5,),
      SizedBox(height: 20),
      Row(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(15)),height: 50,width: 50,
            child: Icon(Icons.groups,color: Colors.white,)),
      ),
        SizedBox(width: 20),
        Text('Shoe factory',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)],),
      Divider(),
      ListTile(title: Text('Announcements',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
      trailing: Text('11/07/2023',style: TextStyle(fontSize: 10),),
      leading: Container(decoration: BoxDecoration(color: Colors.teal[50],borderRadius: BorderRadius.circular(15)),height: 50,width: 50,
          child: Icon(Icons.rss_feed,color: Colors.teal,)),
      subtitle: Text('Lirhe: 1900'),),

    ],),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
            // Navigate to Chats screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => updatesScreen(),
                ),
              );
              break;
            case 2:

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => communitiesScreen(),
                ),
              );
              break;
            case 3:

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => callScreen(),
                ),
              );
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),);
  }
}
