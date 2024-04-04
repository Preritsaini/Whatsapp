import 'package:flutter/material.dart';
import 'package:whatsapp/callscreen.dart';
import 'package:whatsapp/coummunities.dart';
import 'package:whatsapp/settings.dart';
import 'package:whatsapp/updatesscreen.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  int _currentPage = 0;

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
  List<String> contactNames = [
    'Rahul',
    'Manjul',
    'Manit deol',
    'Tushar bhardwaj',
    'Tech bliss',
    'Mohit',
    'Chahat',
    'Shushant',
    'Roger',
    'Manish'
  ];
  List<IconData> messageDetail = [
    Icons.done,
    Icons.done_all,
    Icons.done,
    Icons.done_all,
    Icons.done,
    Icons.done_all,
    Icons.done,
    Icons.done_all,
    Icons.done,
    Icons.done
  ];
  List<String> messages = [
    'Ok',
    'https://open.spotify.com',
    'hogya',
    'Ok',
    "Today's meeting link",
    'Thik h',
    'Done',
    'https://udemy.com',
    'Ha',
    'Ok'
  ];
  List<String> time = [
    '6:51 am',
    'Yesterday',
    'Yesterday',
    'Yesterday',
    '02/04/2024',
    '01/04/2024',
    '28/03/2024',
    '25/04/2024',
    '20/03/2024',
    '10/03/2024'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.teal[600],
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Whatsapp',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            showMenu(
                              context: context,
                              elevation: 9,
                              position: RelativeRect.fromLTRB(80, 90, 0, 0), // Adjust position as needed
                              items: <PopupMenuEntry>[
                                PopupMenuItem(
                                  value: 'Option 1',
                                  child: Text('New group'),
                                ),
                                PopupMenuItem(
                                  value: 'Option 2',
                                  child: Text('New broadcast'),
                                ),
                                PopupMenuItem(
                                  value: 'Option 3',
                                  child: Text('Linked devices'),
                                ),
                                PopupMenuItem(
                                  value: 'Option 1',
                                  child: Text('Starred messages'),
                                ),
                                PopupMenuItem(
                                  value: 'Option 2',
                                  child: Text('Payments'),
                                ),
                                PopupMenuItem(
                                  value: 'Option 3',
                                  child: Text('Settings'),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> settings()));
                                  },
                                ),
                              ],
                            ).then((value) {
                              // Handle menu item selection here
                              if (value != null) {
                                print('Selected: $value');
                              }
                            });
                          },
                          icon: Icon(Icons.more_vert, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ...List.generate(10, (index) => Column(
                children: [
                  ListTile(
                    title: Text(
                      contactNames[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(messageDetail[index], size: 17,),
                        SizedBox(width: 10),
                        Text(messages[index])
                      ],
                    ),
                    trailing: Text(time[index], style: TextStyle(fontSize: 12)),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(imagelist[index]),
                    ),
                  ),
                  SizedBox(height: 10)
                ],
              )),
            ],
          ),
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
          Icons.mark_unread_chat_alt_outlined,
          color: Colors.white,
        ),
        onPressed: () {},
      ),

    );
  }
}
