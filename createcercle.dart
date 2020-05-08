import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final formkey = GlobalKey <FormState>();

  Widget _avatar() {
    return Positioned( child : Row ( children:<Widget> [
      SizedBox( width :80.0),
      Image(   image: AssetImage("send.png"),
        height: 250 ,
        width: 250 ,)
    ]
    ),
    );
  }

  Widget _code() {
    return Positioned(
      top: 50, // hint text + code + en bas un autre bouton send
      child: Column ( children: <Widget>[ Container(
        margin: EdgeInsets.all(20),
        height: 400,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20.0,
                  offset: new Offset(10.0, 10.0)),
            ]),
        child: Container(
          height: 200,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 70.0),
              Container (
                child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child : Image(   image: AssetImage("groupe.png"),height: 400, width: 400,)
                ),),

              SizedBox( height: 70.0),
              Container(
                width: 300.0,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xff739D84))),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Nom du cercle",
                    labelStyle: TextStyle(color:Color(0xff739D84) , fontSize: 18.0 , fontWeight: FontWeight.bold ),
                    hintText: "Saisissez le nom de votre cercle",
                    hintStyle: TextStyle(
                        color: Color(0xff739D84), fontSize: 15.0),
                  ),
                ),
              ),
              SizedBox( height: 30.0),
            ],
          ),
        ),
      ),
        SizedBox( height:20.0),
        Row( children:<Widget> [
          RaisedButton(
            onPressed:() => print("send code"),
            padding :EdgeInsets.all(15.0),
            child: Text("         Prochain          ", style : TextStyle(fontSize:18.0,fontWeight:FontWeight.bold)),
            color:  Color(0xffE8652D),
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
            textColor: Color(0xffF1B97A),
          ),

        ],
        ),
      ] ,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
        backgroundColor: Color(0xff739D84),
        title: Text(
          'Créer un nouveau cercle',
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _code(),

          ],
        ),
      ),
    );
  }
  moveToLastSreen() {
    Navigator.pop(context);
  }
}