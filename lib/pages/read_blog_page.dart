import 'package:flutter/material.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:flutter_html/flutter_html.dart';
import '../custom/header.dart';
import '../custom/header_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ReadBlogPage extends StatefulWidget {
  const ReadBlogPage({super.key});

  @override
  State<ReadBlogPage> createState() => _ReadBlogPageState();
}

class _ReadBlogPageState extends State<ReadBlogPage> {
  late var blogModelData;
  late int id;

  @override
  void didChangeDependencies() {
    List list = ModalRoute.of(context)!.settings.arguments as List;

    id = list[0];

    if (id == 1) {
      blogModelData = list[1];
    }

    if (id == 2) {
      blogModelData = list[1];
    }

    if (id == 3) {
      blogModelData = list[1];
    }

    if (id == 4) {
      blogModelData = list[1];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2E5A88),
        iconTheme: IconThemeData(color: Colors.white),
        //main app bar
        title: Header(
          icon: Icons.comment_outlined,
          title: 'Blog Details',
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .3)),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    'https://pencilbox.edu.bd/${blogModelData.blogImage!}'),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    blogModelData.title!,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('By ${blogModelData.authorName!}')
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.timer),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                        'Date: ${HelperMethod.getDateFormat('dd MMM yyyy', DateTime.parse(blogModelData.createdAt!))}')
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.comment),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Comments'),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () async {
                          String url =
                              'https://pencilbox.edu.bd/blog/details/${blogModelData.id}/${blogModelData.title}';
                          url = url.replaceAll(' ', '-');
                          print(url);
                          await Share.share(url);
                        },
                        child: const Text('Share', style: TextStyle(color: Colors.white),)),
                  ],
                ),
                Html(
                  data: blogModelData.blogPost!,
                  onLinkTap: (url, _, __) async {
                    if (!await launchUrl(Uri.parse(url!))) {
                      throw Exception('Could not launch $url');
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
