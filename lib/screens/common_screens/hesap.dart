import 'package:emlak/screens/office_screens/ilan_paylas_screen.dart';
import 'package:flutter/material.dart';

class Hesap extends StatefulWidget {
  const Hesap({Key? key}) : super(key: key);

  @override
  State<Hesap> createState() => _HesapState();
}

class _HesapState extends State<Hesap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.teal[300],
                width: 190,
                height: 30,
                child:  InkWell(

                    child: Column(
                      children: [
                        Text('Sifre sifirla')
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IlanPaylas()));
                    },
                  )

      ),
      )
    );
  }
}