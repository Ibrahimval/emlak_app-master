import 'package:flutter/material.dart';
class PaylasilmisIlan extends StatefulWidget {
  const PaylasilmisIlan({Key? key}) : super(key: key);

  @override
  State<PaylasilmisIlan> createState() => _PaylasilmisIlanState();
}

class _PaylasilmisIlanState extends State<PaylasilmisIlan> {
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
      
    );
  }
}
