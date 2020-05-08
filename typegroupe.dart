import 'package:flutter/cupertino.dart';
import 'package:flutter_radio_button_group/flutter_radio_button_group.dart';
import 'package:flutter/material.dart';
class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
        backgroundColor: Color(0xff739D84),
        title: Text(
          'Type de cercle',
          style: TextStyle(
              color: Color(0xffF2E9DB),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(icon: Icon(Icons.clear), onPressed: () {
          moveToLastSreen() ;
        }),
      ),
      backgroundColor: Color(0xffF2E9DB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ) ,
          Container(
            margin: EdgeInsets.all(10.0),
            child: new FlutterRadioButtonGroup(
                distanceToNextItem: 50.0,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                distanceToCheckBox: 10.0,
                activeColor: Color(0xffE8652D),
                items: [
                  "Famille",
                  "Amis",
                  "Travail",
                  "Autre",
                ],

                onSelected: (String selected) {
                  print("Selected: $selected");
                }),
          )
        ],
      )
    );
  }
  moveToLastSreen(){
    Navigator.pop(context) ;
  }
}