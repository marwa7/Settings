import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
class join extends StatefulWidget {
  @override
  _joinState createState() => _joinState();
}

// ignore: camel_case_types
class _joinState extends State<join> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
          backgroundColor: Color(0xff739D84),
          title: Text(
            'Rejoindre un cercle',
            style: TextStyle(
                color: Color(0xffF2E9DB),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                moveToLastSreen();
              }),
        ),
      backgroundColor: Color(0xffF2E9DB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50.0,),
          Text("Saisissez le code d'invitation" ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0 ,
              color: Color(0xff739D84)
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            widthFactor: 350,
            child: OTPTextField(
              length: 6,
              width: 350,
              fieldWidth: 50,
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff739D84) ,
                  fontWeight: FontWeight.bold
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              keyboardType: TextInputType.text,
              fieldStyle: FieldStyle.box,
              onChanged: (pin){
                //yasmine hna you can add
              },
              onCompleted: (pin) {
                //meme hna bedli le code
                print("Completed: " + pin);
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Vous pouvez obtenir ce code auprés d'une personne\ndu cercle que vous souhaitez rejoindre" ,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13.0 ,
                color: Colors.black45
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 20.0,
          ) ,
          RaisedButton(
            elevation: 5.0,
            onPressed: () => print('regester button pressed'),
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            color: Color(0xffF1B97A),
            child: Text(
              '      Continuer      ',
              style: TextStyle(
                  color: Color(0xffE8652D),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )
    );
  }
  moveToLastSreen() {
    Navigator.pop(context);
  }
}

class optScreen extends StatefulWidget {
  @override
  _optscreenState createState() => _optscreenState() ;
}

class _optscreenState extends State<optScreen> {

  List<String> currentPin = ["","","","",""] ;
  TextEditingController pinOneController = TextEditingController() ;
  TextEditingController pinTwoController = TextEditingController() ;
  TextEditingController pinThreeController = TextEditingController() ;
  TextEditingController pinFourController = TextEditingController() ;
  TextEditingController pinFiveController = TextEditingController() ;

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0) ,
    borderSide: BorderSide(color: Colors.transparent) ,
  );

  int pinIndex = 5 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          buildExitButton(),
          Expanded(child: Container(
            alignment: Alignment(0, 0.5),
            padding: EdgeInsets.symmetric(horizontal : 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildSecurityText(),
                SizedBox(
                  height: 40.0,
                ),
                buildPinRow(),
              ],
            ),
          ))
        ],
      ),
    );
  }
  buildPinRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder : outlineInputBorder ,
          textEditingController : pinOneController ,
        ),
        PINNumber(
          outlineInputBorder : outlineInputBorder ,
          textEditingController : pinTwoController ,
        ),
        PINNumber(
          outlineInputBorder : outlineInputBorder ,
          textEditingController : pinThreeController ,
        ),
        PINNumber(
          outlineInputBorder : outlineInputBorder ,
          textEditingController : pinFourController ,
        ),
        PINNumber(
          outlineInputBorder : outlineInputBorder ,
          textEditingController : pinFiveController ,
        ),
      ],
    );
  }
  buildSecurityText () {
    return Text('Security Pin',
      style: TextStyle(
          color: Colors.white,
          fontSize: 21.0 ,
          fontWeight: FontWeight.bold
      ),
    ) ;
  }

  buildExitButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: (){},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Icon(Icons.clear, color: Colors.white,),
          ),

        )
      ],
    );
  }
}



class PINNumber extends StatelessWidget {
  final OutlineInputBorder outlineInputBorder ;
  final TextEditingController textEditingController ;
  PINNumber({this.outlineInputBorder , this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: true,
        obscureText: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          border: outlineInputBorder ,
          filled: true ,
          fillColor: Colors.transparent ,
        ),
        style: TextStyle(
            fontWeight: FontWeight.bold ,
            fontSize: 21.0 ,
            color: Color(0xff739D84)
        ),
        maxLines: 1,
        onChanged: (text) {
          if (text.length > 1) {
            textEditingController.text = text.substring(text.length - 1);
          }
        },
        keyboardType: TextInputType.text,
        autofocus: false,
      ),
    );
  }

}


