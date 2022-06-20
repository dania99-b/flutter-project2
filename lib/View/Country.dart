import 'dart:ui';
import '../Models/placeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippo/Models/homeModel.dart';
//import 'package:flutter_map/flutter_map.dart';

import 'Maps.dart';
import 'Place.dart';
import 'home.dart';

class Country extends StatefulWidget {
  final homeModel homemodel;
  const Country({Key? key, required this.homemodel}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: Image(
                      image: NetworkImage(
                          'http://10.0.2.2:8000/${widget.homemodel.image}'),
                      fit: BoxFit.cover,
                      // color: Colors.white.withOpacity(0.9),
                      // colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.search),
                            iconSize: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Text(
                    widget.homemodel.county_name,
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.w600,
                      fontSize: 50,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              // height: 380,
              child: ListView.builder(
                itemCount: widget.homemodel.places.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Place(place: widget.homemodel.places[index])),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(120, 20, 20, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 220,
                                      child: Text(
                                        widget
                                            .homemodel.places[index].place_name,
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                // Container(
                                //   width: 300,
                                //   child: Text(
                                //     'Pla pla information ...',
                                //     style: TextStyle(
                                //       fontSize: 18.0,
                                //     ),
                                //     maxLines: 2,
                                //     overflow: TextOverflow.ellipsis,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 7,
                          bottom: 7,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              width: 110,
                              image: NetworkImage(
                                  'http://10.0.2.2:8000/${widget.homemodel.places[index].photo}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext Filter) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .50,
                      //  color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 32.0,
                            ),
                            child: Text(
                              'Filter by ',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ),
                          Container(
                            height: 294,
                            //color: Colors.grey.shade200,
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 45,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                      top: 10,
                                      right: 20,
                                      left: 20,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'price',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                          child: Checkbox(
                                            checkColor: Colors.blue,
                                            value: false,
                                            onChanged: (bool? value) {},
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  });
            }

            if (value == 1) {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext Filter) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .50,
                      //  color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 32.0,
                            ),
                            child: Text(
                              'Sort by ',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ),
                          Container(
                            height: 294,
                            //color: Colors.grey.shade200,
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 45,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                      top: 10,
                                      right: 20,
                                      left: 20,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'price',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                          child: Checkbox(
                                            checkColor: Colors.blue,
                                            value: false,
                                            onChanged: (bool? value) {},
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  });
            }
            if (value == 2)
              Navigator.push(
                this.context,
                new MaterialPageRoute(
                  builder: (context) => Maps(),
                ),
              );
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          unselectedFontSize: 14,
          backgroundColor: Colors.blue.shade900,
          //  currentIndex: ,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.filter_alt_sharp,
                color: Colors.white,
              ),
              label: 'Filter',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
                backgroundColor: Colors.white,
                label: 'Sort'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.maps_ugc,
                color: Colors.white,
              ),
              label: 'Map',
            )
          ],
        ),
      ),
    );
  }

  // openDialog(contex) => showDialog(
  //   context: context,
  //   builder: (context) => AlertDialog(
  //     title: Text('Map'),
  //     // actions:,
  //   ),
  // );
}
