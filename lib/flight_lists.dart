import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class FlightListsHome extends StatefulWidget {
  const FlightListsHome({super.key});

  @override
  State<FlightListsHome> createState() => _FlightListsHomeState();
}

class _FlightListsHomeState extends State<FlightListsHome> {
  String selectedValue = 'Price';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 76, 72, 1),
      body: Column(children: [
        Container(
          height: size.height * 0.065,
          width: size.width,
          margin: const EdgeInsets.fromLTRB(0, 18, 18, 5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Row(children: [
            Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(46, 76, 72, 1),
            ),
            Text(
              'Flight List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(46, 76, 72, 1),
              ),
            ),
          ]),
        ),
        Expanded(
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Sort By: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: selectedValue,
                                  dropdownColor:
                                      const Color.fromRGBO(46, 76, 72, 1),
                                  items: [
                                    'Price',
                                    'Time',
                                    'Depart',
                                    'Date',
                                  ]
                                      .map((flight) => DropdownMenuItem(
                                          value: flight, child: Text(flight)))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '12 Flights available London to Aachen',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const RotatedBox(
                      quarterTurns: 1,
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Icon(
                          Icons.sync_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: size.height * 0.30,
                          width: size.width,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: destinationTimeDetails(),
                              ),
                              Expanded(
                                child: departmentDetails(),
                              ),
                              Expanded(
                                child: dateAndPriceDetails(),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          bottom: 70,
                          left: -10,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          child: SizedBox(
                            width: size.width * 1,
                            child: customDottedLine(),
                          ),
                        ),
                        const Positioned(
                          bottom: 70,
                          right: -10,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget customDottedLine() => Row(
        children: List.generate(
            800 ~/ 10,
            (index) => Expanded(
                  child: Container(
                    color: index % 2 == 0
                        ? Colors.transparent
                        : const Color.fromRGBO(46, 76, 72, 1),
                    height: 1.5,
                  ),
                )),
      );

  Widget destinationTimeDetails() => Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Row(
          children: [
            const Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'London',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(46, 76, 72, 1),
                      ),
                    ),
                    Text(
                      'LDN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(46, 76, 72, 1),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CustomPaint(
                              painter: CurvePainter(),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.35,
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              left: 55,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.flight,
                                    color: Colors.amber, size: 35),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(46, 76, 72, 0.678),
                              radius: 7,
                              child: CircleAvatar(
                                backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                                radius: 4,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(46, 76, 72, 0.678),
                              radius: 7,
                              child: CircleAvatar(
                                backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                                radius: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 15,
                    left: 60,
                    child: Text(
                      '8h 45m',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Aachen',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(46, 76, 72, 1),
                      ),
                    ),
                    Text(
                      'AOC',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(46, 76, 72, 1),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      );

  Widget departmentDetails() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Depart',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '7:40 AM',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/emirates_logo.png',
                  height: 35,
                )),
            const Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Flight No.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'B843-E',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget dateAndPriceDetails() => Padding(
        padding: const EdgeInsets.fromLTRB(15, 18, 0, 10),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '21 May, 2023',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: const Center(
                child: Text('\$ 870',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    double h = size.height;
    double w = size.width;

    paint.color = const Color.fromRGBO(46, 76, 72, 1);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var startPoint = Offset(0, h);
    var controlPoint1 = Offset(w / 4, h / 4);
    var controlPoint2 = Offset(3 * w / 4, h / 4);
    var endPoint = Offset(w, h);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);
    var curvePath = dashPath(path, dashArray: CircularIntervalList([5, 5]));
    canvas.drawPath(curvePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
