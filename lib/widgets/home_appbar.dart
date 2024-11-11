
import 'package:flutter/material.dart';
import 'package:shopapp/constants.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(15),
          ),
          icon: const Icon(
            Icons.menu,
          ),
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(15),
          ),
          icon: const Icon(
            Icons.notifications,
          ),
        ),
      ],
    );
  }
}
