import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Announcement extends StatelessWidget {
  const Announcement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: DottedBorder(
        color: Colors.black,
        dashPattern: const [8, 4],
        strokeWidth: 6,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: 500,
          height: 160,
          child: Column(
            children: [
              const Text(
                "I have developed a casual game using Flutter. Where you can find its:",
                style: TextStyle(fontFamily: "BitmapFont", fontSize: 13),
              ),
              ...[
                <String, String>{
                  "description": "Source Code",
                  'url': 'https://github.com/serhankars/cat_something_game'
                },
                <String, String>{
                  "description": "Web Link",
                  'url': 'https://serhankars.github.io/catsmth'
                },
                <String, String>{
                  "description": "Google Play Store Link",
                  'url':
                      'https://play.google.com/store/apps/details?id=com.karscodes.cat_smth'
                },
              ].map(
                (e) => Row(
                  children: [
                    const Icon(Icons.link),
                    TextButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(e['url']!);
                        await launchUrl(url);
                      },
                      child: Text(
                        e['description']!,
                        style: const TextStyle(
                            fontFamily: "BitmapFont", fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
