import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippo/Models/TripModel.dart';

import '../API/api.dart';
import 'CheckboxList.dart';

class Reservation extends StatefulWidget {
  final TripModel tripModel;
  const Reservation({Key? key, required this.tripModel}) : super(key: key);
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  late int num;
  List<CheckboxList> info = [];
  void initState() {
    for (int i = 0; i < widget.tripModel.places.length; i++) {
      info.add(CheckboxList(widget.tripModel.places[i].id,
          widget.tripModel.places[i].place_name, false));
    }
    super.initState();
  }

  List<int> selected = [];
  Future _PostReserve() async {
    var data;

    data = {
      'confirm_button': 'yes',
      'trip_id': widget.tripModel.id,
      'passenger_number': num,
      'places_id': selected,
    };

    var response = await CallApi().postdata(data, 'add_reservation');
    print(response.body);
    // var body = json.decode(response.body);
    // print(body);

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
              child: Text(
            'Reservation Confirmed',
          )),
          content: Text(
              'If payment is not made within three days to the office, the reservation will be canceled'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'))
          ],
        ),
      );
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Text('Reserve'),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: 380,
                child: ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: CheckboxListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              info[index].name,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              info[index].isSelected = value!;
                              if (info[index].isSelected == true) {
                                selected.add(info[index].id);
                              } else if (info[index].isSelected == false) {
                                selected.removeWhere(
                                    (element) => element == info[index].id);
                              }
                            });
                          },
                          value: info[index].isSelected,
                          activeColor: Colors.blue.shade900,
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Select the number of passenger',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue.shade900, width: 2)),
                height: 50,
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (i) {
                    num = i + 1;
                  },
                  itemExtent: 40,
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: List<Widget>.generate(
                      widget.tripModel.available_num_passenger,
                      (index) => Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(50)),
                child: FlatButton(
                  child: Text(
                    'Reserve',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _PostReserve();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
