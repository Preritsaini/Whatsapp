import 'package:flutter/material.dart';
import 'package:whatsapp/coummunities.dart';
import 'package:whatsapp/dashboard.dart';
import 'package:whatsapp/updatesscreen.dart';

class callScreen extends StatefulWidget {
  const callScreen({super.key});

  @override
  State<callScreen> createState() => _callScreenState();
}

class _callScreenState extends State<callScreen> {
  int _currentIndex = 3;
  int _currentPage = 3;
  List<String> imagelist = [
    "assets/images/dog.jpg",
    "assets/images/random.jpg",
    "assets/images/random2.jpg",
    "assets/images/random3.png",
    "assets/images/random4.png",
    "assets/images/random5.png",
    "assets/images/random6.png",
    "assets/images/random7.jpeg",
    "assets/images/random7.png",
    'assets/images/techbliss.jpg'
  ];
  List<String> contacts = ['Abhishek','Chahat','Pranav','Didi','Mohit','Rohan','Rahul','Manish',
    'Mohit','Rohan','Rahul','Manish'];
  List<String> date =['31 March,8:19 pm','30 March,7:19 pm','29 March,8:10 pm','20 March,5:10 pm',
    '19 March,6:19 am','15 March,8:19 pm','13 March,8:19 pm','11 March,8:19 pm'
  ,'10 March,8:19 pm','09 March,8:19 pm','08 March,8:19 pm','07 March,8:19 pm'];
  List<IconData> icondetail = [Icons.call,Icons.videocam,Icons.call,Icons.videocam,Icons.call,Icons.videocam,
    Icons.call,Icons.videocam,Icons.call,Icons.videocam,Icons.call,Icons.videocam,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal[600],
      title: Text('WhatsApp',style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),),
      actions: [
        Row(children: [
          Icon(Icons.camera_alt_outlined),
        SizedBox(width: 10),
        IconButton(onPressed: (){}, icon: Icon(Icons.search)),
      PopupMenuButton<String>(
        onSelected: (value) {
          print('Selected: $value');
        },
        offset: Offset(0,50),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

          const PopupMenuItem<String>(
            value: 'Option 1',
            child: Text('Clear call log'),
          ),
          const PopupMenuItem<String>(
            value: 'Option 2',
            child: Text('Settings'),
          ),
          ],)],),
    ]),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          ListTile(leading: CircleAvatar(radius: 25,backgroundColor: Colors.teal[500],child:
            Icon(Icons.link,color: Colors.white,),),
            title: Text('Create a call link'),
            subtitle: Text('share a link for your WhatsApp call'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [SizedBox(width: 13),
              Text('Recent',style: TextStyle(fontSize: 15),)
            ],),
          ),
          ...List.generate(10, (index) => ListTile(title:Text(contacts[index]),
          leading: CircleAvatar(radius: 25,backgroundImage: AssetImage(imagelist[index]),),
          subtitle: Row(children: [ Icon(Icons.call_made,size: 18,color: Colors.green,),SizedBox(width: 5),
            Text(date[index]),
          ],),
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icondetail[index],color: Colors.teal,),
          ),))
        ],
      ),
    ),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(
          Icons.call,
          color: Colors.white,
        ),
        onPressed: () {},
      ),

    );
  }
}

