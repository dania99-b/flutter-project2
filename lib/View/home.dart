import 'dart:convert';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trippo/View/Country.dart';
import 'package:trippo/API/api.dart';
import 'package:trippo/Models/homeModel.dart';
import '../Models/TripModel.dart';
import 'Attractions.dart';
import 'Trip.dart';
import 'officesList.dart';
import 'NavBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Search');

  List<homeModel> _countries = <homeModel>[];
  List<TripModel> _trips = <TripModel>[];
  @override
  void initState() {
    _FetchCountries().then((value) {
      setState(() {
        _countries.addAll(value);
      });
    });
    _FetchTrips().then((value) {
      setState(() {
        _trips.addAll(value);
      });
    });
    super.initState();
  }

  Future<List<homeModel>> _FetchCountries() async {
    var response = await CallApi().getdata('get_all_country');
    // print(response.body);
    var countries = <homeModel>[];
    var item = json.decode(response.body);

    for (var i in item) {
      countries.add(homeModel.fromJson(i));
    }

    return countries;
  }

  Future<List<TripModel>> _FetchTrips() async {
    var response = await CallApi().getdata('get_trip_place');
    // print(response.body);
    var trips = <TripModel>[];
    var item = json.decode(response.body);

    for (var i in item) {
      trips.add(TripModel.fromJson(i));
    }

    return trips;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
            drawer: NavBar(),
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,

              actions: [
                IconButton(
                  icon: cusIcon,
                  onPressed: () {
                    setState(() {
                      if (this.cusIcon.icon == Icons.search) {
                        this.cusIcon = Icon(Icons.cancel);

                        // this.cusSearchBar = TypeAheadField(
                        //   textFieldConfiguration: TextFieldConfiguration(
                        //       autofocus: true,
                        //       style: DefaultTextStyle.of(context)
                        //           .style
                        //           .copyWith(fontStyle: FontStyle.italic),
                        //       decoration: InputDecoration(
                        //           border: OutlineInputBorder())),
                        //   suggestionsCallback: (pattern) async {
                        //     ;
                        //   },
                        //   itemBuilder: (context, suggestion) {
                        //     return ListTile(
                        //       title: Text(suggestion['name']),
                        //       subtitle: Text('\$${suggestion['price']}'),
                        //     );
                        //   },
                        //   onSuggestionSelected: (suggestion) {
                        //     // Navigator.push(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //       builder: (context) =>
                        //     //           Trip()),
                        //     // );
                        //   },
                        // );
                      } else {
                        this.cusIcon = Icon(Icons.search);
                        this.cusSearchBar = Text('Search');
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
              // title: cusSearchBar,
              bottom: TabBar(
                labelColor: Colors.white70,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Offices",
                  ),
                  Tab(
                    text: "Attractions",
                  ),
                  Tab(
                    text: "Discounts",
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.grey.shade200,
            body: TabBarView(
              children: [
                Column(
                  children: [
                    Container(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      height: 160,
                      //color: Colors.lightBlueAccent,
                      // color: Colors.pinkAccent,
                      child: ListView.builder(
                        itemCount: _countries.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Country(homemodel: _countries[index])),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 0, 4),
                              width: 200,
                              //  color: Colors.purple,
                              child: Column(
                                //alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: Colors.blueGrey.shade800),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0.0, 2.0),
                                            blurRadius: 6.0,
                                          )
                                        ]),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        height: 120,
                                        width: 188,

                                        image: NetworkImage(
                                          //  'http://192.168.1.109:8000/appimages/mmmm.jpg',
                                          'http://10.0.2.2:8000/${_countries[index].image}',
                                        ),
                                        // color: Colors.white.withOpacity(0.7),
                                        colorBlendMode: BlendMode.modulate,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //  color: Colors.deepPurpleAccent,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          _countries[index].county_name,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: _trips.length,
                          padding: EdgeInsets.only(top: 10, bottom: 15),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Trip(tripModel: _trips[index])),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(17, 5, 20, 5),
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          120, 20, 20, 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                //     color: Colors.red,
                                                width: 130,
                                                child: Text(
                                                  _trips[index].trip_name,
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                _trips[index].price.toString() +
                                                    ' SP',
                                                style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              _trips[index].trip_status,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  _trips[index].trip_start,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  _trips[index].trip_start,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 15,
                                    bottom: 15,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        width: 110,
                                        image: NetworkImage(
                                            'http://10.0.2.2:8000/${_trips[index].photo}'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                OfficesList(),
                Attractions(),
                Text('Offices'),
              ],
            )),
      ),
    );
  }
}
