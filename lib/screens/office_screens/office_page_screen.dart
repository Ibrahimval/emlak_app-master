import 'package:emlak/screens/office_screens/ilan_paylas_screen.dart';
import 'package:emlak/screens/common_screens/messaging_screen.dart';
import 'package:emlak/screens/office_screens/paylasilmis_ilanlar.dart';
import 'package:flutter/material.dart';

class OfficePageScreen extends StatefulWidget {
  const OfficePageScreen({Key? key}) : super(key: key);
  @override
  State<OfficePageScreen> createState() => _OfficePageScreenState();
}

class _OfficePageScreenState extends State<OfficePageScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {

     final pages = [
      Container(
        margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20
          ),
          children: [
            InkWell(
              child: Stack(
                children: [
                   ClipRRect(
                     child: Image.asset(
                       'images/ev.jpg',
                     height: 250,
                       fit: BoxFit.cover,
                     ),
                     borderRadius: BorderRadius.circular(15),
                   ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text('Ilan ekle',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),

                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => IlanPaylas()));
              },
              splashColor: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            InkWell(
              child: Stack(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'images/time.jpg',
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text('Paylaşılmış ilanlar',style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    ),

                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => PaylasilmisIlan()));
              },
              splashColor: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ],

        ),
      ),
      Center(child: Text('Hesabim', style: TextStyle(fontSize: 37))),
      MessagingScreen()

    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 40,
        selectedIndex: index,
        onDestinationSelected: (index)
        => setState(() => this.index= index),
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_outlined,color: Colors.teal,),
              selectedIcon: Icon(Icons.home_outlined,size: 19,color: Colors.teal,),
              label: 'Ana Sayfa'),
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

