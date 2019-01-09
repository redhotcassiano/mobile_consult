
import 'package:flutter/material.dart';
import 'package:mobile_consult/screens/list_users.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTab extends StatelessWidget{

  @override  
  
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(200, 255, 17, 158), Color.fromARGB(1, 127, 108, 120)],
          begin: Alignment.topLeft, 
          end: Alignment.bottomRight

        )
      ),
    );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),        
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Mobile Consult"),
                centerTitle: true,
              ),
            ),
                                         
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          margin: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
          color: Colors.transparent,
          child: MapsDemo(),
        ),
           
      ], 
    );    
  }
   
}

class MapsDemo extends StatefulWidget {
  @override
  State createState() => MapsDemoState();
}

class MapsDemoState extends State<MapsDemo> {

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 300.0,
              height: 200.0,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
              ),
            ),
          ),
          RaisedButton(
            child: const Text('Go to London'),
            onPressed: mapController == null ? null : () {
              mapController.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                  bearing: 270.0,
                  target: LatLng(51.5160895, -0.1294527),
                  tilt: 30.0,
                  zoom: 17.0,
                ),
              ));
            },
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }
}

