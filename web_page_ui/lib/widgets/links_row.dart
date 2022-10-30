import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksRow extends StatelessWidget {
  const LinksRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset('assets/imgs/linkedin.png'),
          iconSize: 45,
          onPressed: () async {
            final Uri url =
                Uri.parse('https://www.linkedin.com/in/serhan-kars-0ba5b238/');

            await launchUrl(url);
          },
        ),
        IconButton(
          icon: Image.asset('assets/imgs/github.png'),
          iconSize: 30,
          onPressed: () async {
            final Uri url = Uri.parse('https://github.com/serhankars');

            await launchUrl(url);
          },
        ),
        IconButton(
          icon: Image.asset('assets/imgs/twitter.png'),
          iconSize: 30,
          onPressed: () async {
            final Uri url = Uri.parse('https://twitter.com/karsparskambala');

            await launchUrl(url);
          },
        ),
      ],
    );
  }
}
