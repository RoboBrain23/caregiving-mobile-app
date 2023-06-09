import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myfirstproject/constants.dart';
import 'package:myfirstproject/views/HomePage.dart';
import 'package:myfirstproject/views/chair/chair.dart';
import 'package:myfirstproject/views/login/components/body.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../login/components/roundedbutton.dart';

class ChairPage extends StatefulWidget {
  final CardItem item;
  const ChairPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ChairPage> createState() => _ChairPageState();
}

class _ChairPageState extends State<ChairPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // style button important
    final ButtonStyle flatbuttonstyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      backgroundColor: kPrimaryColor,
    );
    //style button important
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('WheelChair details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                child: AspectRatio(
                  aspectRatio: 4 / 4,
                  child: Image.asset(
                    widget.item.urlImage,
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.item.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 35,
              ),
            ),
            Text(
              widget.item.subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
            Text(
              'Patient Details:   etc',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Spacer(),
            roundedbutton(
                size: size,
                flatbuttonstyle: flatbuttonstyle,
                text: 'Enter ',
                textcolor: Colors.white,
                press: () {
                  reload();
                })
          ],
        ),
      ),
    );
  }

  Future<void> reload() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  Age: globalage,
                  Gender: globalgender,
                  Username: globalusername,
                )));
    return;
  }
}
