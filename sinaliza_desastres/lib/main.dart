import 'dart:ui' as prefix0;
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sinaliza_desastres/models/Desastre.dart';
import 'models/Usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Maps com Degrade',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("Sinaliza desastre",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              minMaxZoomPreference: MinMaxZoomPreference(15, 17),
              initialCameraPosition: CameraPosition(target: LatLng(-8.9068, -36.4943), zoom: 15.75),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.my_location, color: Colors.white),
        backgroundColor: Colors.red,
        onPressed: (){
          getLocation();
        },
      ),

        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text("Nome User"),
                  accountEmail: new Text("Nome Email"),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Icon(
                        Icons.person_outline,
                        color: Colors.red),
                  ),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaConfig()),
                  );
                },
                title: new Text("Desastres",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                trailing: new Icon(
                    Icons.map,
                    color: Colors.black),
              ),
              new Divider(),

              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaDeDesastres()),
                  );
                },
                title: new Text("Configurações",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

                trailing: new Icon(
                    Icons.build,
                    color: Colors.black),
              ),
              new Divider(),

              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaSobre()),
                  );
                },
                title: new Text("Sobre",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                trailing: new Icon(
                    Icons.info,
                    color: Colors.black),

              ),


            ],
          ),
        )

    );
  }
}

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Column(

        children: <Widget>[

          Text('\n\tAplicativo desenvolvido pela:\n',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 17.0,
                fontWeight: FontWeight.bold
            ),

          ),
          Image(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp6Nm7HzKFNx178MTpplsTSUmWphqNYsfAdSFkEYRrBXNgvuUj&s'),
            height: 300,
            width: 400,
          ),

          Text('\n\nPelos alunos:\n\nAntônio Adelino\nArmstrong Lohãns',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 17.0,
                fontWeight: FontWeight.bold
            ),

          ),
        ],
      ),
    );
  }
}


class TelaDeDesastres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class TelaConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tipo = TextEditingController();
    final latitude = TextEditingController();
    final longitude = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Desastres"),
      ),
      body:Column(

        children: <Widget>[
          TextFormField(
            controller: tipo,
            decoration: InputDecoration(
                labelText: 'Tipo do desastre'
            ),
          ),

          TextFormField(
            controller: latitude,
            decoration: InputDecoration(
                labelText: 'Latitude'
            ),
          ),

          TextFormField(
            controller: longitude,
            decoration: InputDecoration(
                labelText: 'Longitude'
            ),
          ),

      Text('\n'),
        FloatingActionButton(

            child: Icon(Icons.save_alt, color: Colors.white),
            backgroundColor: Colors.green,
            onPressed: (){
              var desastre = Desastre(tipo.text, latitude.text, longitude.text);
              print('tipo: '+desastre.tipo);
              print('latitude: '+desastre.lat);
              print('longitude: '+desastre.long);

            },

          ),


        ],
      ),

    );
  }
}


//class SecondRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Second Route"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Go back!'),
//        ),
//      ),
//    );
//  }
//}