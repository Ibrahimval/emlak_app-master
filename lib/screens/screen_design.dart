import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emlak/screens/office_screens/office_page_screen.dart';
import 'package:emlak/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:csc_picker/csc_picker.dart';

List<String> emlakTuru = <String> ['Kiralık', 'Satılık'];

class ScreenDesign extends StatefulWidget {
  const ScreenDesign({Key? key}) : super(key: key);
  @override
  State<ScreenDesign> createState() => _ScreenDesignState();
}


TextEditingController _ilanBasligi = TextEditingController();
TextEditingController _ilanDetayi = TextEditingController();
TextEditingController _emlakFiyati = TextEditingController();
TextEditingController _binaYasi = TextEditingController();
TextEditingController _odaSayisi = TextEditingController();
TextEditingController _banyoSayisi = TextEditingController();
TextEditingController _olduguKat = TextEditingController();
TextEditingController _aidat = TextEditingController();
TextEditingController _dopozito = TextEditingController();
CollectionReference collectionRef =
FirebaseFirestore.instance.collection('ilanlar');
class _ScreenDesignState extends State<ScreenDesign> {
  File? image;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  String? dropdownValue2 = emlakTuru[0];
  Future pickImage() async{
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if( img == null ) return;
      final imageTemporary = File(img.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {

    }

  }
  String? countryValue = "";
  String? ilce = "";
  String? sehir = "";
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
        children: [
          Expanded(
              child: Stack(
                children: [
                  // Container(
                  //
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(50),
                  //         topRight: Radius.circular(50),
                  //       )
                  //   ),
                  //
                  // ),
                  Container(
                    margin: EdgeInsets.fromLTRB(28, 70, 10, 10),
                    padding: EdgeInsets.all(20),
                    width: 400,
                    height: 500,

                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          FloatingActionButton(

                              child: Text('Resim yukle'),
                              onPressed: (){
                                   pickImage();

                              }
                          ),
                            image!=null?
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(image!.path),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height: 300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ): Text(' Hic bir resim secilmedi'),

                          SizedBox(height: 20),
                          TextField(
                            controller: _ilanBasligi,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'ilan basligi giriniz',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                border: OutlineInputBorder(

                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            controller: _ilanDetayi,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Ilan detayi',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 50
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                border: OutlineInputBorder(

                                )
                            ),
                            maxLines: null,
                          ),
                          SizedBox(height: 40,),

                          Row(
                            children: [
                              Text(

                                  'Adres Bilgisi girin :',
                                style: TextStyle(color: Colors.teal,
                                fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          CSCPicker(
                            currentCountry: "Turkey",
                            flagState: CountryFlag.DISABLE,
                            layout: Layout.vertical,
                           showCities: true,
                          showStates: true,
                            onCountryChanged: (country){
                             countryValue = country;
                            },

                            onCityChanged: (cityValue){

                           sehir = cityValue;
                            },

                            onStateChanged: (stateValue){
                   ilce = stateValue;
                            },

                            countrySearchPlaceholder: "Ülke",
                            stateSearchPlaceholder: "İl",
                            citySearchPlaceholder: "İlçe",


                            countryDropdownLabel: "Ulke",
                            stateDropdownLabel: "Il",
                            cityDropdownLabel: "İlçe",

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: _emlakFiyati,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Emlak fiyati',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                border: OutlineInputBorder(

                                )
                            ),

                          ),
                          SizedBox(height: 40),
                          Container(
                            width: 280,
                            height: 50,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 1),

                                  )
                                ],
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(20),
                              menuMaxHeight: 500,
                              value: dropdownValue2,
                              alignment: Alignment.center,
                              icon: const Icon(
                                Icons.arrow_drop_down, color: Colors.teal,),
                              elevation: 20,
                              iconSize: 25,
                              style: const TextStyle(color: Colors.teal),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue2 = value;
                                });
                              },
                              items: emlakTuru.map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: _binaYasi,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Bina yasi',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10
                                ),
                                border: OutlineInputBorder(

                                )
                            ),

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: _odaSayisi,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Oda sayisi',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                border: OutlineInputBorder(

                                )
                            ),

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: _banyoSayisi,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Banyo sayisi',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                border: OutlineInputBorder(

                                )
                            ),

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: _olduguKat,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Oldugu kat',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10
                                ),
                                border: OutlineInputBorder(

                                )
                            ),

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: _aidat,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Aidat',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10
                                ),
                                border: OutlineInputBorder(

                                )
                            ),

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: _dopozito,
                            style: TextStyle(color: Colors.teal),
                            decoration: InputDecoration(
                                labelText: 'Dopozito',
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.teal,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10
                                ),
                                border: OutlineInputBorder(

                                )
                            ),

                          ),
                          SizedBox(height: 20,),
                          Mybutton(
                              color: Colors.teal,
                              title: 'Ilan paylas',
                              onPressed: (){

    Map<String,String> sendData = {
    'ilanDetayi':_ilanDetayi.text,
    'ilanBasligi':_ilanBasligi.text,
    'BinaYasi':_binaYasi.text,
    'aidat':_aidat.text,
    'banyoSayisi':_banyoSayisi.text,
    'emlakFiyati':_emlakFiyati.text,
    'odaSayisi':_odaSayisi.text,
    'olduguKat':_olduguKat.text,
      'il':sehir.toString(),
      'ilce': ilce.toString(),
      'emlakTuru': dropdownValue2.toString()
    };
    collectionRef.add(sendData).then((value) =>
        showDialog(context: context, builder: (context)
          =>
        AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text('Ilaniniz basariyla yayınlandı'),
                Icon(Icons.check_circle,color: Colors.teal,size: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Colors.teal
                    ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OfficePageScreen()));
                      }
                      ,
                      child: Text('Ana sayfaya dön')),
                )
              ],
            ),
          )
        )
    ));
    },

                          )

                        ],),
                    ),
                  )
                ],
              )
          )
        ],
      ),
      ),

    );
  }



}
