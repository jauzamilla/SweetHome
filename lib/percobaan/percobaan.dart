import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyClass extends StatefulWidget {
  const MyClass({super.key});

  @override
  State<MyClass> createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      child: GestureDetector(
        onTap: _launchUrl,
        // onTap: () => launcherUrl(_whatsappUrl),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.whatsapp,
            size: 27,
          ),
        ),
      ),
    )));
  }
}

void _launchUrl(
  // {
  // // required int phone, required String message
  // }
  ) async {
    String phone = '6289525560021';
    String message = 'Apakah Masih Ada?';
    final  Uri _url = Uri.parse(
    'whatsapp://send?phone=$phone&text=${Uri.parse(message)}');
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
