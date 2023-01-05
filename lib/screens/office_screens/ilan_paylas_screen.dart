import 'package:emlak/screens/screen_design.dart';
import 'package:flutter/material.dart';


class IlanPaylas extends StatefulWidget {
  const IlanPaylas({Key? key}) : super(key: key);

  @override
  State<IlanPaylas> createState() => _IlanPaylasState();
}

class _IlanPaylasState extends State<IlanPaylas> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
            'Ilan paylaş',
             style: TextStyle(
                 fontFamily: 'Raleway'
             ),
        ),
        centerTitle: true,
      ),
      body: ScreenDesign(),
    );
  }
}
