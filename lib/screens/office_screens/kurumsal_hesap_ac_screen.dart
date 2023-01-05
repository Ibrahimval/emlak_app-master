import 'package:emlak/screens/common_screens/login.dart';
import 'package:emlak/widgets/my_button.dart';
import 'package:flutter/material.dart';

class KurumsalHesap extends StatefulWidget {
  const KurumsalHesap({Key? key}) : super(key: key);

  @override
  State<KurumsalHesap> createState() => _KurumsalHesapState();
}

class _KurumsalHesapState extends State<KurumsalHesap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(color: Colors.teal),
              onChanged: (value){},
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.home_work_outlined,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'Şirket adı',
                hintStyle: TextStyle(
                    color: Colors.teal,
                ),
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
            SizedBox(height: 15),
            TextField(
              style: TextStyle(color: Colors.teal),
              onChanged: (value){},
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'Sabit telefon',
                hintStyle: TextStyle(
                  color: Colors.teal,
                ),
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
            SizedBox(height: 15),
            TextField(
              style: TextStyle(color: Colors.teal),
              onChanged: (value){},
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'E-posta adresinizi girin',
                hintStyle: TextStyle(
                  color: Colors.teal,
                ),
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
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.teal),
              onChanged: (value){},
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,color: Colors.teal,),
                disabledBorder: InputBorder.none,
                hintText: 'Şifrenizi girin',
                hintStyle: TextStyle(
                  color: Colors.teal,
                ),
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
            SizedBox(height: 15),
            Mybutton(
                color: Colors.teal,
                title: 'Kayit Ol',
                onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute
                       (builder: (context) => LoginPage()));
                }
            )
          ],
        ),
      ),
    );
  }
}
