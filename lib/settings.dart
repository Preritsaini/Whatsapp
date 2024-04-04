import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  List<String> titles = ['Account','Privacy','Avatar','Chats','Notifications','Storage and data','App language',
  'Help','Invite a friend'];
  List<IconData> leading =[Icons.key,Icons.lock,Icons.face,Icons.chat,Icons.notifications,Icons.storage,
  Icons.circle,Icons.help,Icons.group];
  List<String> subtitles = ['security notifications,change number','Block contacts,disappearing',
  'Create,edit,profile photo','Theme,wallpapers,chat history','Message,group and call tones','Network usage',
  "English(device's language)",'Help centre,contact us',''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,title: Text('Settings'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.search),
        )
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('assets/images/profile.jpg'),),
              title: Text('Prerit Saini',style: TextStyle(fontSize: 19),),
              subtitle: Text('No Pain, No Gain'),
            trailing: Icon(Icons.qr_code,color: Colors.green,),),
            Divider(),
            ...List.generate(titles.length, (index) => ListTile(
              title: Text(titles[index]),
              subtitle: Text(subtitles[index]),
              leading: Icon(leading[index]),
            )),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Column(children: [
              Text('From'),
              Text('meta',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              
            ],)],)
          ],
        ),
      ),
    );
  }
}
