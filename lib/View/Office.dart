import 'package:flutter/material.dart';

class Office extends StatefulWidget {
  // final PlaceModel place;
  // const Place({Key? key, required this.place}) : super(key: key);
  @override
  _OfficeState createState() => _OfficeState();
}

class _OfficeState extends State<Office> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 230,
          width: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image(
            image: AssetImage('assets/Aleppo.png'),
            fit: BoxFit.cover,
            // color: Colors.white.withOpacity(0.9),
            // colorBlendMode: BlendMode.modulate,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            iconSize: 30,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
