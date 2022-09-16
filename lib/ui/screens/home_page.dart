import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not24/ui/screens/widget/infor_section.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.blue,
              tabs: [
                Text(
                  'NEWS',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'LE MONDE',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'TECH',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'SCIENCE',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'SPORT',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.turned_in,
                    size: 30,
                    color: Colors.grey,
                  ))
            ],
            centerTitle: true,
            backgroundColor: Colors.black,
            title: SizedBox(
                height: 40, child: Image.asset('assets/images/france.png'))),
        body: const TabBarView(
          children: [
            InfoSection(
              section: 'breaking-news',
            ),
            InfoSection(
              section: 'world',
            ),
            InfoSection(
              section: 'technology',
            ),
            InfoSection(
              section: 'science',
            ),
            InfoSection(
              section: 'sports',
            ),
          ],
        ),
      ),
    );
  }
}
