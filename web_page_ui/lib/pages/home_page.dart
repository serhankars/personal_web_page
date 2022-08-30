import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _mouseX = 0.0;
  double _mouseY = 0.0;
  String _mousePositionHorizontal = "";
  String _mousePositionVertical = "";
  int topBorder = 90;
  int bottomBorder = 300;

  @override
  void setState(VoidCallback fn) {
    precacheImage(const AssetImage('assets/imgs/profile.png'), context);
    precacheImage(const AssetImage('assets/imgs/profile_up.png'), context);
    precacheImage(const AssetImage('assets/imgs/profile_left_up.png'), context);
    precacheImage(
        const AssetImage('assets/imgs/profile_left_down.png'), context);
    precacheImage(
        const AssetImage('assets/imgs/profile_right_up.png'), context);
    precacheImage(
        const AssetImage('assets/imgs/profile_right_down.png'), context);
    precacheImage(const AssetImage('assets/imgs/profile_down.png'), context);
    precacheImage(const AssetImage('assets/imgs/profile_left.png'), context);
    precacheImage(const AssetImage('assets/imgs/profile_right.png'), context);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return MouseRegion(
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Serhan Kars",
                  style: TextStyle(
                      fontFamily: "BitmapFont",
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/imgs/profile.png"),
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                          "assets/imgs/profile${_mousePositionHorizontal}${_mousePositionVertical}.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/imgs/github.png'),
                      iconSize: 30,
                      onPressed: () {
                        String url = 'https://github.com/serhankars';
                        html.window.open(url, '_blank');
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/imgs/twitter.png'),
                      iconSize: 30,
                      onPressed: () {
                        String url = 'https://twitter.com/learningathing';
                        html.window.open(url, '_blank');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          onHover: (event) {
            _mouseX = event.position.dx;
            _mouseY = event.position.dy;
            double leftBorder = constraints.maxWidth / 2 - 100;
            double rightBorder = constraints.maxWidth / 2 + 100;

            setState(() {
              if (_mouseX < leftBorder) {
                _mousePositionHorizontal = "_left";
              } else if (_mouseX > rightBorder) {
                _mousePositionHorizontal = "_right";
              } else {
                _mousePositionHorizontal = "";
              }

              if (_mouseY < topBorder) {
                _mousePositionVertical = "_up";
              } else if (_mouseY > bottomBorder) {
                _mousePositionVertical = "_down";
              } else {
                _mousePositionVertical = "";
              }
            });
          },
        );
      }),
    );
  }
}
