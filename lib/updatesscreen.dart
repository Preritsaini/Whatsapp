import 'package:flutter/material.dart';
import 'package:whatsapp/callscreen.dart';
import 'package:whatsapp/coummunities.dart';
import 'package:whatsapp/dashboard.dart';

class updatesScreen extends StatefulWidget {
  const updatesScreen({super.key});

  @override
  State<updatesScreen> createState() => _updatesScreenState();
}

class _updatesScreenState extends State<updatesScreen> {
  int _currentPage = 1;
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
  List<String>  logodetails =['Icc','Royal Ch..','Mumbai In..','Xiomi'];
  List<String> logo = ['assets/images/download.jpeg',
  'assets/images/images.jpeg','assets/images/images (1).jpeg','assets/images/Xiomi_logo_(2021).svg.png'];
  List<String> contactNames = [
    'Rahul',
    'Manjul',
    'Manit d..',
    'Tushar ..',
    'Tanish',
    'Pankaj',
    'Rajat',
    'Mohit',
    'Chahat',
    'Shushant',
    'Roger',
    'Manish'
  ];
  int _currentIndex = 1;
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
                    value: 'Option 2',
                    child: Text('Settings'),
                  ),
                ],)],),
          ]),
      body: Column(children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Status',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
            ),
            IconButton(
              onPressed: () {
                showMenu(
                  context: context,

                  position: RelativeRect.fromLTRB(90, 145, 0, 0), // Adjust position as needed
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      value: 'Option 1',
                      child: Text('Status Policy'),
                    ),
                  ],
                ).then((value) {
                  // Handle menu item selection here
                  if (value != null) {
                    print('Selected: $value');
                  }
                });
              },
              icon: Icon(Icons.more_vert, color: Colors.black),
            )
          ],),
        ),
        SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Badge(padding: EdgeInsets.all(0),offset: Offset(0,40),largeSize: 15,smallSize: 10,
                        backgroundColor: Colors.teal,label: Icon(Icons.add,color: Colors.white,size: 15,),
                    child: CircleAvatar(radius: 30,backgroundImage: AssetImage('assets/images/profile.jpg'),)),
                  ),
                  Text('My stat..')
                ],
              ),SizedBox(width: 10),
              ...List.generate(10, (index) => Row(
                children: [
                  Column(children: [
                    CircleAvatar(backgroundColor: Colors.red,radius: 30,backgroundImage: AssetImage(imagelist[index]),),
                    SizedBox(height: 10),
                    Text(contactNames[index]),
                  ],),
                  SizedBox(width: 10),
                ],
              ),)
            ],),
          ),
        ),
        Divider(),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text('Channels',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Icon(Icons.add)
          ],),
        ),
        SizedBox(height: 15),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text('Find Channels',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            Row(children: [
              Text('see all',style: TextStyle(color: Colors.green),),SizedBox(width: 5,),
              Icon(Icons.arrow_forward_ios_outlined,size: 13,color: Colors.green,),
            ],
            )
          ],),
        ),
        SizedBox(height: 20),SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Row(children: [SizedBox(width: 20),
          ...List.generate(logo.length, (index) => Row(
            children: [
              Container(height: 120,width: 100,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey)
              ),
              child: Column(children: [SizedBox(height: 10),
                CircleAvatar(radius: 25,backgroundImage: AssetImage(logo[index]),),
                SizedBox(height: 5),
                Text(logodetails[index],style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5),
                Container(width: 80,height: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Colors.teal[50]),child: Center(child: Text('Follow',style: TextStyle(color: Colors.teal,
                fontWeight: FontWeight.bold,fontSize: 13),)),)
              ],),),
              SizedBox(width: 20,)
            ],
          ),),
          ],),
        ),
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
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 16), // Add spacing between FABs
          SizedBox(height: 40,width: 40,
            child: FloatingActionButton(
              backgroundColor: Colors.teal[50],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.create,
                color: Colors.teal,
              ),
              onPressed: () {

                print('FAB 1 pressed');
              },
            ),
          ),
          SizedBox(height: 16), // Add spacing between FABs
          FloatingActionButton(
            backgroundColor: Colors.teal[600],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: () {
              print('FAB 2 pressed');
            },
          ),
        ],
      ),
    );
  }
}
