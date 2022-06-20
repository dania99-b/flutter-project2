import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippo/Models/PlacesNameIdModel.dart';
import 'package:trippo/Models/TripModel.dart';

import '../API/api.dart';

class AddTrip extends StatefulWidget {
  @override
  _AddTripState createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  List<DynamicWidget> list = [];
  late List<int> pricesList = [];
  List<int> placesList = [];

  void _addDynamic() {
    list.add(DynamicWidget());
    setState(() {});
  }

  // Date() {
  //   for (int i = 0; i < list.length; i++) {
  //     pricesList.add(int.parse(list[i].));
  //   }
  // }

  File? _file;
  String? fileName;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      _file = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 40,
              ),
              child: Column(
                children: [
                  Text(
                    'Add Trip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Trip name',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.indigo,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          //  controller: ,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Trip Start',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.indigo,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          // controller: ,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Trip End',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.indigo,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Trip Price',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.indigo,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Trip Statuas',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.indigo,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Trip Price',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.indigo,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Trip Plan',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.indigo,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Trip Notes',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.indigo,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Available Passengers num',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.indigo,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Add Places',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _addDynamic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (_, index) => list[index],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: getImage,
                    child: Container(
                      width: 320,
                      height: 275,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6E6E6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _file != null
                          ? Image.file(
                              _file!,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/plus.svg',
                                  ),
                                  const Text(
                                    'upload photo',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(50)),
                    child: FlatButton(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
class DynamicWidget extends StatefulWidget {
  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    _FetchPlaces().then((value) {
      _places.addAll(value);
    });

    super.initState();
  }

  String? value;
  int? id;
  List<PlacesNameIdModel> _places = <PlacesNameIdModel>[];

  Future _FetchPlaces() async {
    var response = await CallApi().getdata('get_all_places');

    var places = <PlacesNameIdModel>[];
    var item = json.decode(response.body);

    for (var i in item) {
      places.add(PlacesNameIdModel.fromJson(i));
    }

    return places;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              isExpanded: true,
              hint: Text(
                'Select Place',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.blue.shade900,
              ),
              iconSize: 30,
              borderRadius: BorderRadius.circular(8),
              items: _places.map((itemsname) {
                return DropdownMenuItem(
                  value: itemsname.place_name,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      itemsname.place_name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newVal) {
                setState(() {
                  value = newVal as String?;
                  for (int i = 0; i < _places.length; i++) {
                    if (_places[i].place_name == value) id = _places[i].id;
                    // print(id);
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 50,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Trip End',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.indigo,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
