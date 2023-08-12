import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/career_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CareerDetailsPage extends StatefulWidget {
  const CareerDetailsPage({super.key});

  @override
  State<CareerDetailsPage> createState() => _CareerDetailsPageState();
}

class _CareerDetailsPageState extends State<CareerDetailsPage> {
  late Data careerData;

  @override
  void didChangeDependencies() {
    careerData = ModalRoute.of(context)!.settings.arguments as Data;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Career details',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://pencilbox.edu.bd/${careerData.careerImage}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset('images/placeholder.png'),
              ),

              // Image.network(
              //     'https://pencilbox.edu.bd/${careerData.careerImage}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  careerData.title!,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'No of Vacancy : ${careerData.noOfVacancy!}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Html(
                data: careerData.careerDetails!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
