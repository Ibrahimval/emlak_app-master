
import 'package:emlak/screens/common_screens/hesap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:emlak/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../office_screens/office_page_screen.dart';
import '../user_screens/user_screen.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
         ]
      ),
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 24),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                  Icons.account_circle,
                 color: Colors.teal,
                size: 60,
              ),
              SizedBox(height: 15,),

              TextFormField(
                controller: _email,
                style: TextStyle(color: Colors.teal),
                onChanged: (value){},
                decoration: InputDecoration(
                  icon: Icon(
                      Icons.email,
                    color: Colors.teal,
                  ),
                  hintText: 'Gmail adresinizi girin',
                  hintStyle: TextStyle(color: Colors.teal),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                      ,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal,width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _password,
                style: TextStyle(color: Colors.teal),
                obscureText: true,
                onChanged: (value){},
                decoration: InputDecoration(
                  icon: Icon(
                      Icons.lock,
                    color: Colors.teal,
                  ),
                  hintText: 'Şifrenizi giriniz',
                  hintStyle: TextStyle(color: Colors.teal),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal,width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              Container(
                margin: EdgeInsets.fromLTRB(45,0,0,10),
                child: Mybutton(
                    color: Colors.teal,
                    title: 'Giriş Yap',
                    onPressed:  () async{
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text,
                        )
                            .then((kullanici){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => UserPage()));
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showDialog(context: context, builder: (context)
                          => AlertDialog(
                            content: Text(
                              "Boyle kayitli bir email adresi yoktur",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                          ));
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },

                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 0, 10, 0),
                child: TextButton(

                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Hesap()));
                    },
                    child: Text(
                      'Şifremi unuttum',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15
                      ),
                    )
                ),
              ),
            ]
        ),
      ),
    );

  }



   @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
