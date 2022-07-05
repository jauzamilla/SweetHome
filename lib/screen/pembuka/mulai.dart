import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sweethome/PercobaanFull/login.dart';
import 'package:sweethome/satulagi/login.dart';
import 'package:sweethome/screen/pembuka/login.dart';
import 'registrasi.dart';

class ToMyApp extends StatelessWidget {
  const ToMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarouselWithIndicatorDemo(),
      routes: {'/loginPage': (context) => LoginPage()},
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> myImage = [
    Container(
        height: 600, width: 600, child: Image.asset('image/Group 155.png')),
    Container(
        height: 600, width: 600, child: Image.asset('image/Group 78.png')),
    Container(
        height: 600,
        width: 600,
        child: Image.asset(
          'image/Group 79.png',
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141228),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider(
                items: myImage,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 1.0,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: myImage.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                ' Find Your',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Poppins-Medium'
                ),
              ),
              Text(
                ' Sweet Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Poppins-Medium'
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 59.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginPage');
                  },
                  child: const Text(
                    'Mulai',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(240, 44),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ]),
      ),
    );
  }
}
