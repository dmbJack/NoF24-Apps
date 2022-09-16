import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not24/models/articles.dart';

class InfoDetailsScreen extends StatefulWidget {
  final Articles articles;
  const InfoDetailsScreen({Key? key, required this.articles}) : super(key: key);

  @override
  State<InfoDetailsScreen> createState() => _InfoDetailsScreenState();
}

class _InfoDetailsScreenState extends State<InfoDetailsScreen> {
  bool isTurned = false;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.articles.publishedAt);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share,
                size: 28,
                color: Colors.white.withOpacity(0.7),
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/france.png',
          height: 40,
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 34, 36, 37),
                    width: size.width,
                    height: 220,
                    child: Hero(
                      tag: widget.articles.title,
                      child: CachedNetworkImage(
                        imageUrl: widget.articles.image,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 340,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isTurned = !isTurned;
                        });
                      },
                      icon: Icon(
                        (isTurned) ? Icons.turned_in : Icons.turned_in_not,
                        size: 40,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 340,
                    child: IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         WebviewScreen(url: widget.articles.url),
                        //   ),
                        // );
                      },
                      icon: Icon(
                        Icons.link,
                        size: 35,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.copyright,
                          color: Colors.grey.withOpacity(0.7),
                          size: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.articles.getSourceName,
                          style: GoogleFonts.lato(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 10),
                        )
                      ],
                    ),
                    Text(widget.articles.title,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.articles.description,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Première publication : ${date.day.toString()}/${date.month.toString()}/${date.year.toString()}',
                      style:
                          GoogleFonts.lato(color: Colors.grey.withOpacity(0.7)),
                    ),
                    Text(
                      'Dernière modification :  ${date.day.toString()}/${date.month.toString()}/${date.year.toString()}',
                      style:
                          GoogleFonts.lato(color: Colors.grey.withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Text par :',
                          style: GoogleFonts.lato(
                              color: Colors.grey.withOpacity(0.8),
                              fontSize: 20),
                          children: [
                            TextSpan(
                              text: ' France 24',
                              style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 22, 104, 171),
                                  fontSize: 20),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.articles.content,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
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
