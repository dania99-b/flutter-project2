import 'package:flutter/material.dart';

class Attractions extends StatefulWidget {
  @override
  _AttractionsState createState() => _AttractionsState();
}

Text _RatingStars(int rating) {
  String star = '';
  for (int i = 0; i < rating; i++) star += '⭐ ';
  return Text(star);
}

class _AttractionsState extends State<Attractions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          // height: 380,
          child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           Place(place: widget.homemodel.places[index])),
                  // );
                },
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(45, 5, 20, 5),
                      height: 150,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    'Attraction 1',
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
                              height: 4.0,
                            ),
                            _RatingStars(4),
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
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          width: 130,
                          image: AssetImage('assets/Lattakia.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
