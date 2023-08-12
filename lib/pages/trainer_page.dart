import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import 'package:provider/provider.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({super.key});

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  late TrainerProvider trainerProvider;

  @override
  void didChangeDependencies() {
    trainerProvider = Provider.of(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Trainer',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          itemCount: trainerProvider.trainerModelList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://pencilbox.edu.bd/${trainerProvider.trainerModelList[index].trainerImage!}'),
                ),
                title: Text(
                  trainerProvider.trainerModelList[index].trainerName!,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff212121)),
                ),
                subtitle: Text(
                  trainerProvider.trainerModelList[index].trainerTrack!,
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff616161)),
                ),
                trailing: IconButton(
                  icon: const ImageIcon(
                      AssetImage(
                        'images/chat.png',
                      ),
                      color: Color(0xffDB1E37)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('Trainer_details_page',
                        arguments: trainerProvider.trainerModelList[index]);
                  },
                ),
              ),
            );
          }),
    );
  }
}
