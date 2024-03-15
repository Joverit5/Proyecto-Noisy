import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class CoordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ubicación'),
        ),
        body: Center(
          child: StreamBuilder<LocationData>(
            stream: _locationStream,
            builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasData) {
                final locationData = snapshot.data;
                return Text('Latitud: ${locationData?.latitude}, Longitud: ${locationData?.longitude}');
              }

              return Text('Sin datos');
            },
          ),
        ),
      ),
    );
  }

  Stream<LocationData> get _locationStream async* {
    final location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    yield _locationData;
  }
}