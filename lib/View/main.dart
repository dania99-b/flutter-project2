import 'package:flutter/material.dart';
import 'package:trippo/View/Office.dart';
import 'package:trippo/View/Reservation.dart';
import 'package:trippo/View/UserProfile.dart';
import 'package:trippo/View/addPlace.dart';
import 'package:trippo/View/home.dart';
import 'package:trippo/View/SplashScreen.dart';
import 'package:trippo/View/login.dart';
import 'AddTrip.dart';
import 'Favourites.dart';
import 'Maps.dart';
import 'Place.dart';
import 'Trip.dart';
import 'officerDashboard.dart';
import 'officesList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddTrip(),
    );
  }
}
