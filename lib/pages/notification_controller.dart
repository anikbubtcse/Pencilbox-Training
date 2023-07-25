import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationController extends StatefulWidget {
  const NotificationController({super.key});

  @override
  State<NotificationController> createState() => _NotificationControllerState();
}

class _NotificationControllerState extends State<NotificationController> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Notification Controller',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SwitchListTile(
                        activeColor: Colors.red,
                        title: Text('General Notification',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff212121))),
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            isSelected = value;
                          });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
