import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emlak/screens/office_screens/kurumsal_hesap_ac_screen.dart';
import 'package:emlak/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget{
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();

}

TextEditingController _adTEC = TextEditingController();
TextEditingController _soyadTEC = TextEditingController();
TextEditingController _telNoTEC = TextEditingController();
TextEditingController _emailTEC = TextEditingController();
TextEditingController _sifreTEC = TextEditingController();
CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('users');


class _SignInState extends State<SignIn> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
            )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),

        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _adTEC,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'Adinizi giriniz',
                hintStyle: TextStyle(color: Colors.teal),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

            ),
            SizedBox(height: 25),
            TextField(
              controller: _soyadTEC,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'Soyadiniz giriniz',
                hintStyle: TextStyle(color: Colors.teal),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

            ),
            SizedBox(height: 25),
            TextField(
              controller: _telNoTEC,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'Telefon numaraniz',
                hintStyle: TextStyle(color: Colors.teal),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

            ),
            SizedBox(height: 25),
            TextField(
              controller: _emailTEC,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'Email adresinizi girin',
                hintStyle: TextStyle(color: Colors.teal),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

            ),
            SizedBox(height: 25),
            TextField(
              controller: _sifreTEC,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: '***************',
                hintStyle: TextStyle(color: Colors.teal),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Mybutton(
                color: Colors.teal,
                title: 'Kayit Ol',
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTEC.text,
                      password: _sifreTEC.text,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                     showDialog(context: context, builder: (context)
                     => AlertDialog(
                       content: Text(
                           "Sifreniz zayif",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                       ),
                     ));
                    } else if (e.code == 'email-already-in-use') {
                      showDialog(context: context, builder: (context)
                      => AlertDialog(
                        content: Text(
                            "Girdiginiz email adresi daha once kullanildi",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ));
                    }
                  } catch (e) {
                    print(e);
                  }
                Map<String,String> sendData = {
                  'name':_adTEC.text,
                   'lastName':_soyadTEC.text,
                   'telNo':_telNoTEC.text,
                    'email':_emailTEC.text,
                     'password':_sifreTEC.text
                };
                collectionRef.add(sendData).
                whenComplete(
                        () =>
                            AlertDialog(
                          content: Text(
                            "Hesabini basariyla kayit edildi",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                        ) );

                },
              ),
            ),
            SizedBox(height: 10),
             Container(
               margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
               child:  TextButton(

                   onPressed: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => KurumsalHesap()));
                   },
                   child: Text(
                     'Kurumsal Hesap Aç',
                     style: TextStyle(
                         color: Colors.teal,
                         fontSize: 15
                     ),
                   )
               ),
             )
          ],
        ),
      ),
    );
  }


}

