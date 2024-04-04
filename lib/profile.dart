import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Profile',style: (TextStyle(fontSize: 23,fontWeight: FontWeight.normal)),),backgroundColor: Colors.teal[600],),
    body: Column(
      children: [
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Badge(backgroundColor: Colors.teal,offset: Offset(-20,160),largeSize: 30,
              label: Icon(Icons.camera_alt,color: Colors.white,size: 20,),
              child: CircleAvatar(radius: 100,backgroundImage:
              AssetImage('assets/images/profile.jpg'),)),
        ],),
        SizedBox(height: 20),
        ListTile(title: Text('Name',style: TextStyle(color: Colors.grey[600],fontSize: 17),),
        leading: Icon(Icons.person,color: Colors.grey[600],),
        subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text('Prerit Saini',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),),
            SizedBox(height: 5),
          Text('This is not your username or pin,This name willbe visible to your whatsapp contacts'),
        ],),
        trailing: Icon(Icons.create,color: Colors.teal,),
        isThreeLine: true,),
        SizedBox(height: 20),
        ListTile(title: Text('About',style: TextStyle(color: Colors.grey[600],fontSize: 17),),
        trailing: Icon(Icons.create,color: Colors.teal,),
        subtitle: Text('No Pain, No Gain',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
        leading: Icon(Icons.error_outline,color: Colors.grey[600],),),
        ListTile(title: Text('Phone'),
        subtitle: Text('+91 9105023038',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
        leading: Icon(Icons.call,color: Colors.grey[600],),
        )
      ],
    ),);
  }
}
