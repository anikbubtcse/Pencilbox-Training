import 'package:flutter/material.dart';

class HeaderMenu extends StatefulWidget {
  const HeaderMenu({super.key});

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                        'images/pencilbox_logo.png',
                        fit: BoxFit.contain,
                      )
              ),
              const SizedBox(
                width: 80,
              ),
              const Column(
                children: [
                  Icon((Icons.person)),
                  Text(
                    'profile',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
