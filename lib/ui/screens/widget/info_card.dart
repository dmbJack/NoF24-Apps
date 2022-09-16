import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not24/models/articles.dart';
import 'package:not24/ui/screens/info_details_screens.dart';

class InfoCard extends StatelessWidget {
  final Articles articles;
  const InfoCard({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InfoDetailsScreen(articles: articles),
          ),
        );
      }),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: const Color.fromARGB(221, 39, 38, 38),
            width: 350,
            height: 330,
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color.fromARGB(255, 50, 50, 51),
                  width: 350,
                  height: 200,
                  child: Hero(
                    tag: articles.title,
                    child: CachedNetworkImage(
                      imageUrl: articles.image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    articles.title,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
