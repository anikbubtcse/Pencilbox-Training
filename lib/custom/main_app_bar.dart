import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
   MainAppBar({
    super.key,
    this.title='',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (contxt) {
          return IconButton(
            icon: Image.asset(
              'images/pencilbox.png',
              height: 32,
              width: 32,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Text(
        '$title',
        style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xff878787)),
      ),
      centerTitle: true,
      elevation: 1,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('notification_page');
              },
              child: const Icon(
                (Icons.notifications_none_outlined),
                size: 30,
              )),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}