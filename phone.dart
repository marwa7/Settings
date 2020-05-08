import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_currency_pickers/country_pickers.dart';



class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final formKey = GlobalKey<FormState>();

  Widget _text() {
    return Positioned(
      top: 50,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 210,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(10.0, 10.0),
              )
            ]),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.0),
            Expanded(
              child:
              Row(
              children: <Widget>[
                SizedBox(width: 25.0),
                Expanded(
                  child: Container(

                    child : CurrencyPickerDropdown(
                    initialValue: 'DZD',
                    itemBuilder: _buildCurrencyDropdownItem,
                    onValuePicked: (Country country) {
                      print("${country.name}");
                    },
                  ),
                ),),
                Container(
                  width: 240.0,
                  child :
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration :InputDecoration (
                      enabledBorder:UnderlineInputBorder(borderSide :BorderSide(color:Color(0xff739D84))),
                      focusedBorder:UnderlineInputBorder(borderSide :BorderSide(color:Color(0xffE8652D))),
                      hintText:"téléphone",
                      hintStyle:TextStyle(color:Color(0xff739D84), fontSize: 20.0),
                    ),

                  ),),


              ],
            ),) ,
            SizedBox(height: 5.0),
            RaisedButton(
              onPressed: () => formKey.currentState.save(),
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Color(0xffF1B97A),
              child: Text('  Enregistrer  ' , style : TextStyle( color: Color(0xffE8652D),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),


              ),),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("${country.currencyCode}"),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: (){
      moveToLastSreen() ;
    },
        child:Scaffold(
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
            backgroundColor: Color(0xff739D84),
            title: Text(
              'Changer votre numéro de téléphone',
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
          body: SingleChildScrollView(
            child: Stack(
            children: <Widget>[
              Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
              _text(),
          ],
        ),
      ),
    ));
  }
  moveToLastSreen(){
    Navigator.pop(context) ;
  }
}
