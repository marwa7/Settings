import 'package:flutter/material.dart';

/*import 'package:provider/provider.dart';*/
class AdressePage extends StatefulWidget {
  @override
  _AdressePageState createState() => _AdressePageState();
}

class _AdressePageState extends State<AdressePage> {
  final formKey = GlobalKey<FormState>();

  Widget _text() {
    return Positioned(
      top: 50,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 170,
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
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.mail_outline,
                        color: Color(0xff739D84),
                        size: 25.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: 250.0,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff739D84))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE8652D))),
                            hintText: "NomPrénom@gmail.com",
                            hintStyle: TextStyle(
                                color: Color(0xff739D84), fontSize: 15.0),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 20.0),
                RaisedButton(
                  elevation: 5.0,
                  padding: EdgeInsets.all(15.0),
                  onPressed: () => formKey.currentState.save(),
                  child: Text('  Enregistrer  ',
                      style: TextStyle(
                          color: Color(0xffE8652D),
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                  color: Color(0xffF1B97A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        moveToLastSreen() ;
      },
        child: Scaffold(
      backgroundColor: Color(0xffF2E9DB),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
        backgroundColor: Color(0xff739D84),
        title: Text(
          'Changer votre adresse e-mail',
          style: TextStyle(
              color: Color(0xffF2E9DB),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(icon: Icon(Icons.clear), onPressed: () {
          moveToLastSreen() ;
        }),
      ),
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
