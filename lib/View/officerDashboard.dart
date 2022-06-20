import 'package:flutter/material.dart';
import 'package:trippo/View/addPlace.dart';

class OfficerDashBoard extends StatefulWidget {
  @override
  _OfficerDashBoardState createState() => _OfficerDashBoardState();
}

class _OfficerDashBoardState extends State<OfficerDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0, left: 20, right: 20),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              children: [
                InkWell(
                  child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_location_alt,
                            color: Colors.blue.shade900,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Add Place',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  onTap: () {
                    Navigator.push(
                      this.context,
                      new MaterialPageRoute(
                        builder: (context) => AddPlace(),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_box_outlined,
                            color: Colors.blue.shade900,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Add Trip',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  onTap: () {},
                ),
                InkWell(
                  child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_location_rounded,
                            color: Colors.blue.shade900,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Edit Place',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  onTap: () {},
                ),
                InkWell(
                  child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.blue.shade900,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Edit Trip',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  onTap: () {},
                ),
                InkWell(
                  child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.blue.shade900,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Delete Trip',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  onTap: () {},
                ),
                InkWell(
                  child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   'Delete Trip',
                          //   style: TextStyle(
                          //       fontSize: 25,
                          //       color: Colors.blue.shade900,
                          //       fontWeight: FontWeight.w600),
                          // ),
                        ],
                      )),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
