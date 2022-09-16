import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:not24/models/articles.dart';
import 'package:not24/ui/screens/widget/info_card.dart';
import 'package:provider/provider.dart';

import '../../../repositories/data_repositorie.dart';

class InfoSection extends StatefulWidget {
  final String section;
  const InfoSection({Key? key, required this.section}) : super(key: key);

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  List<Articles> articles =[];
  @override
  void initState() {
    super.initState();
    loading();
  }


  Future<void> loading() async {
    final data = Provider.of<DataRepository>(context, listen: false);
    await data.getNewsSection(sectionName: widget.section);
  }
  Future<List<Articles>> getArticles () async {
    return Provider.of<DataRepository>(context).getInfoSection;
  }
  @override
  Widget build(BuildContext context) {
    List<Articles> articles = Provider.of<DataRepository>(context).getInfoSection;
    return FutureBuilder(
      future: getArticles(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitCircle(
              color: Colors.blue,
              size: 25,
            ),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return InfoCard(articles: articles[index]);
              },
            );
          } else {
            return const Center(
              child: Icon(Icons.error, color: Colors.white, size: 30,)
            );
          }
        }
      },
    );
    // return (infoSection.isEmpty)
    //     ? const Center(
    //         child: SpinKitCircle(
    //           color: Colors.blue,
    //           size: 30,
    //         ),
    //       )
    //     : ListView.builder(
    //         itemCount: infoSection.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           return InfoCard(articles: infoSection[index]);
    //         },
    //       );
  }
}
