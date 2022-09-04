import 'package:flutter/material.dart';
import '../model/enums/horizontal_position.dart';
import '../model/enums/vertical_position.dart';

class EyeRollingAvatar extends StatelessWidget {
  final HorizontalPosition horizontalPosition;
  final VerticalPosition verticalPosition;

  const EyeRollingAvatar(
      {Key? key,
      required this.horizontalPosition,
      required this.verticalPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.center &&
                  verticalPosition == VerticalPosition.center)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.left &&
                  verticalPosition == VerticalPosition.center)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_left.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.left &&
                  verticalPosition == VerticalPosition.up)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_left_up.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.left &&
                  verticalPosition == VerticalPosition.down)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_left_down.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.right &&
                  verticalPosition == VerticalPosition.center)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_right.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.right &&
                  verticalPosition == VerticalPosition.up)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_right_up.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.right &&
                  verticalPosition == VerticalPosition.down)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_right_down.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.center &&
                  verticalPosition == VerticalPosition.up)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_up.png"),
          ),
        ),
        Opacity(
          opacity: (horizontalPosition == HorizontalPosition.center &&
                  verticalPosition == VerticalPosition.down)
              ? 1
              : 0,
          child: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/imgs/profile_down.png"),
          ),
        ),
      ],
    );
  }
}
