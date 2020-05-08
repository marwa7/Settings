import 'package:flutter/material.dart';
import 'package:flutter_app1/app_screens/inviter.dart';
import 'package:flutter_app1/app_screens/nomcercle.dart';
import 'package:flutter_app1/app_screens/typegroupe.dart';
import 'package:http/http.dart' as http;
import 'friend/friend.dart' ;
import 'package:flutter/cupertino.dart';
// ignore: camel_case_types
class gestionCercleAdmin extends StatefulWidget {
  @override
  _gestionCercleAdminState createState() => _gestionCercleAdminState();
}

// ignore: camel_case_types
class _gestionCercleAdminState extends State<gestionCercleAdmin> {
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
      trailing:  Icon (Icons.expand_more,color:  Color(0xffE8652D), ) ,
      onTap : (){showDialog(barrierDismissible:false ,
        context: context ,
        builder : (context){ return AlertDialog( title: Text("Supprimer le membre", style: TextStyle( color: Color(0xff739D84),)),
          actions: <Widget> [
            FlatButton ( child: Text ('Oui', style: TextStyle( color:  Color(0xffE8652D),)), onPressed:(){Navigator.pop(context);}),
            FlatButton ( child: Text ('Non',
                style: TextStyle( color:  Color(0xffE8652D),)),
                onPressed:(){Navigator.pop(context);}),
          ],
        );
        },) ; } ,

      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name ),
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
          iconTheme: IconThemeData( color:Color(0xffF2E9DB) ),
          backgroundColor: Color(0xff739D84),
          title: Text('Nom du cercle' , style: TextStyle(
              color: Color(0xffF2E9DB),
              fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),),
          leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                moveToLastSreen();
              }),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.center,
                height: 200.0,
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
              SizedBox(
                height: 50.0,
              ),

              Card(

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.only(left: 18.0, right: 18.0),
                  color: Colors.white ,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.group),
                              iconSize: 30.0,
                              color:Color(0xffE8652D),
                              onPressed: () {}
                            ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Modifier le nom de cercle', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,

                          ),),
                          SizedBox(
                            width: 25.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.edit),
                              iconSize: 30.0,
                              color: Color(0xffF1B97A),
                            onPressed: () => Navigator.of(context)
                                .push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new NamecerclePage(),
                            )),)
                        ],
                      ),
                      Container(
                        width: 350.0,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.tag_faces),
                              iconSize: 30.0,
                              color:Color(0xffE8652D),
                              onPressed: () {}
                              ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Modifier le type de cercle', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,

                          ),),
                          SizedBox(
                            width: 25.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.edit),
                              iconSize: 30.0,
                              color: Color(0xffF1B97A),
                              onPressed: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                new RadioButtonExample(),
                              )))
                        ],
                      ),
                      Container(
                        width: 350.0,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.group_add),
                              iconSize: 30.0,
                              color:Color(0xffE8652D),
                              onPressed: () {}),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Inviter des gens', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,

                          ),),
                          SizedBox(
                            width: 105.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.chevron_right),
                              iconSize: 30.0,
                              color: Color(0xffF1B97A),
                              onPressed: ()  => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                new InvitePage(),
                              )))
                        ],
                      ),
                      Container(
                        width: 350.0,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.call_missed_outgoing),
                              iconSize: 30.0,
                              color:Color(0xffE8652D),
                              onPressed: () {}),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Quitter le cercle', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,

                          ),),
                          SizedBox(
                            width: 112.4,
                          ),
                          IconButton(
                              icon: Icon(Icons.chevron_right),
                              iconSize: 30.0,
                              color: Color(0xffF1B97A),
                              onPressed: () {showDialog(barrierDismissible:false ,
                                context: context ,
                                builder : (context){ return AlertDialog( title: Text("êtes vous sure de quitter ce cercle ?", style: TextStyle( color: Color(0xff739D84),)),
                                  actions: <Widget> [
                                    FlatButton ( child: Text ('Quitter', style: TextStyle( color:  Color(0xffE8652D),)), onPressed:(){Navigator.pop(context);}),
                                    FlatButton ( child: Text ('Annuler',
                                        style: TextStyle( color:  Color(0xffE8652D),)),
                                        onPressed:(){Navigator.pop(context);}),
                                  ],
                                );
                                },) ; } )
                        ],
                      ),Container(
                        width: 350.0,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.delete),
                              iconSize: 30.0,
                              color:Color(0xffE8652D),
                              onPressed: () {}),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Supprimer le cercle', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,

                          ),),
                          SizedBox(
                            width:81.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.chevron_right),
                              iconSize: 30.0,
                              color: Color(0xffF1B97A),
                              onPressed: () {showDialog(barrierDismissible:false ,
                                context: context ,
                                builder : (context){ return AlertDialog( title: Text("êtes vous sure de supprimer ce cercle ?", style: TextStyle( color: Color(0xff739D84),)),
                                  actions: <Widget> [
                                    FlatButton ( child: Text ('Supprimer', style: TextStyle( color:  Color(0xffE8652D),)), onPressed:(){Navigator.pop(context);}),
                                    FlatButton ( child: Text ('Annuler',
                                        style: TextStyle( color:  Color(0xffE8652D),)),
                                        onPressed:(){Navigator.pop(context);}),
                                  ],
                                );
                                },) ; } )
                        ],
                      ),
                    ],
                  )
              ),



            ],
          ),
        )

    );
  }
  moveToLastSreen() {
    Navigator.pop(context);
  }
}

class ProfileImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(
      'profile.gif',);
    Image image = Image(image: assetImage, fit: BoxFit.cover);
    return Container(
      child: image,
    );
  }
}
