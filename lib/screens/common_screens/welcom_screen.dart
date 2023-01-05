import 'package:emlak/screens/common_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:emlak/widgets/my_button.dart';
import 'package:emlak/screens/common_screens/sign_in_screen.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Emlak sahibi ol !',
            style: TextStyle(
              color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 30,)
            ),
           Image.asset(
             'images/buildings.png',
             color: Colors.teal
           ),
            Mybutton(
                color: Colors.teal,
                title: 'Giris Yap',
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }

            ),
            SizedBox(height: 10,),
            Mybutton(
                color: Colors.teal,
                title: 'Kayit Ol ',
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                }

            ),
      ]
            ),

        ),
      );

  }
}


