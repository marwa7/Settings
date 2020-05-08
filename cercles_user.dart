import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/app_screens/createcercle.dart';
import 'package:flutter_app1/app_screens/joincercle.dart';
import 'package:http/http.dart' as http;
import 'friend/friend.dart' ;
import 'gestion_cercle.dart' ;

// ignore: camel_case_types
class cercleUser extends StatefulWidget {
  @override
  _cercleUserState createState() => _cercleUserState();
}

// ignore: camel_case_types
class _cercleUserState extends State<cercleUser> {
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    http.Response response =
        await http.get('https://randomuser.me/api/?results=25');

    setState(() {
      _friends = Friend.allFromResponse(response.body);
    });
  }

  Widget _buildFriendListTile(BuildContext context, int index) {
    var friend = _friends[index];

    return new ListTile(
      trailing:  Icon (Icons.chevron_right,color:  Color(0xffE8652D), ) ,
        onTap : ()=> Navigator.of(context).push(new MaterialPageRoute( builder :
            (BuildContext context ) => new gestionCercle(),)) ,

    leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.location),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2E9DB),
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
          backgroundColor: Color(0xff739D84),
          title: Text(
            'Gestion de cercle',
            style: TextStyle(
                color: Color(0xffF2E9DB),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            moveToLastSreen() ;
          }),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox( width: 10,) ,
                FlatButton(
                  onPressed:() => Navigator.of(context).push(new MaterialPageRoute( builder :
                      (BuildContext context ) => new join(),)),
                  padding :EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.group , color: Color(0xffF2E9DB),) ,
                      Text(" Rejoindre", style : TextStyle(fontSize:15.0,fontWeight:FontWeight.bold)),
                    ],
                  ) ,
                  color:  Color(0xffF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Color(0xffF2E9DB),
                ),
                SizedBox(width: 10.0,),
                FlatButton(
                  onPressed:() => Navigator.of(context).push(new MaterialPageRoute( builder :
                      (BuildContext context ) => new CreatePage(),)),
                  padding :EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.group_add , color: Color(0xffF2E9DB),) ,
                      Text(" Créer", style : TextStyle(fontSize:15.0,fontWeight:FontWeight.bold)),
                    ],
                  ) ,
                  color:  Color(0xffF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Color(0xffF2E9DB),
                ),
                SizedBox( width: 30,) ,
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30.0,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 290.0,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                     color: Colors.white,
                      boxShadow : [BoxShadow (color:Colors.black12,
                          blurRadius:20.0,
                          offset:new Offset(10.0,10.0)),]),

                  child: Center(
                    child: ListView.builder(
                      itemCount: _friends.length,
                      itemBuilder: _buildFriendListTile,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
  moveToLastSreen(){
    Navigator.pop(context) ;
  }
}
