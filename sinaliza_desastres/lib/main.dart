import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'Usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Maps com Degrade',
      theme: ThemeData(
        primarySwatch: Colors.grey,
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
        title: new Text("Sinaliza desastre",
        style: TextStyle(
            color: Colors.black54,
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
        backgroundColor: Colors.green,
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
                        color: Colors.black),
                  ),
              ),
              new ListTile(
                title: new Text("Desastres",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                trailing: new Icon(
                    Icons.map,
                    color: Colors.black54),
              ),
              new Divider(),

              new ListTile(
                title: new Text("Configurações",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                trailing: new Icon(
                    Icons.build,
                    color: Colors.black54),
              ),
              new Divider(),

              new ListTile(
                title: new Text("Sobre",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                trailing: new Icon(
                    Icons.info,
                    color: Colors.black54),
              )
            ],
          ),
        )

    );
  }
}