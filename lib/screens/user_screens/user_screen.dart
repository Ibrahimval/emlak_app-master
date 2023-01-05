import 'package:flutter/material.dart';

import '../common_screens/messaging_screen.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(child: Text('Hesabim', style: TextStyle(fontSize: 37))),
      MessagingScreen()

    ];
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(onPressed: (){}, icon:Icon(Icons.search),),
                IconButton(onPressed: (){}, icon:Icon(Icons.notifications_active),),
              ],
            ),
          )
        ],
        title: Text(
            'Hoş geldin Ta',
                style:
                TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
            )
        ),
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 40,
        selectedIndex: index,
        onDestinationSelected: (index)
        => setState(() => this.index= index),
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.manage_accounts_outlined,color: Colors.teal,),
              selectedIcon: Icon(Icons.manage_accounts_outlined,size: 19,color: Colors.teal,),
              label: 'Hesap'),
          NavigationDestination(
              icon: Icon(Icons.message,color: Colors.teal),
              selectedIcon: Icon(Icons.message,size: 19,color: Colors.teal,),
              label: 'Mesajlar')
        ],
      ),
    );
  }
}

