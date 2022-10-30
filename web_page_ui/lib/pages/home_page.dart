import 'package:flutter/material.dart';
import 'package:serhankars_github_io/widgets/links_row.dart';

import '../model/enums/horizontal_position.dart';
import '../model/enums/vertical_position.dart';
import '../widgets/announcement.dart';
import '../widgets/eye_rolling_avatar.dart';

class HomePage extends StatefulWidget {
  static const String route = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _mouseX = 0.0;
  double _mouseY = 0.0;
  HorizontalPosition _mousePositionHorizontal = HorizontalPosition.center;
  VerticalPosition _mousePositionVertical = VerticalPosition.center;
  int topBorder = 90;
  int bottomBorder = 300;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
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
    super.didChangeDependencies();
  }

  void _onPositionChange(Offset position, BoxConstraints constraints) {
    _mouseX = position.dx;
    _mouseY = position.dy;
    double leftBorder = constraints.maxWidth / 2 - 100;
    double rightBorder = constraints.maxWidth / 2 + 100;

    setState(() {
      if (_mouseX < leftBorder) {
        _mousePositionHorizontal = HorizontalPosition.left;
      } else if (_mouseX > rightBorder) {
        _mousePositionHorizontal = HorizontalPosition.right;
      } else {
        _mousePositionHorizontal = HorizontalPosition.center;
      }

      if (_mouseY < topBorder) {
        _mousePositionVertical = VerticalPosition.up;
      } else if (_mouseY > bottomBorder) {
        _mousePositionVertical = VerticalPosition.down;
      } else {
        _mousePositionVertical = VerticalPosition.center;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onPanUpdate: (details) {
            _onPositionChange(details.globalPosition, constraints);
          },
          onPanEnd: (DragEndDetails details) {
            setState(() {
              _mousePositionHorizontal = HorizontalPosition.center;
              _mousePositionVertical = VerticalPosition.center;
            });
          },
          child: MouseRegion(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Serhan Kars",
                        style: TextStyle(
                            fontFamily: "BitmapFont",
                            fontWeight: FontWeight.w700,
                            fontSize: 50),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 270,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EyeRollingAvatar(
                              horizontalPosition: _mousePositionHorizontal,
                              verticalPosition: _mousePositionVertical,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Software Engineer",
                              style: TextStyle(
                                  fontFamily: "BitmapFont", fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LinksRow(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Announcement(),
                  ],
                ),
              ),
            ),
            onHover: (event) {
              _onPositionChange(event.position, constraints);
            },
          ),
        );
      }),
    );
  }
}
