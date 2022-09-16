import 'package:flutter/material.dart';
import 'package:not24/ui/screens/home_page.dart';

class LoadingScreens extends StatefulWidget {
  const LoadingScreens({Key? key}) : super(key: key);

  @override
  State<LoadingScreens> createState() => _LoadingScreensState();
}

class _LoadingScreensState extends State<LoadingScreens> {
  @override
  void initState() {
    super.initState();
    loading();
  }

  Future<void> loading() async {
    await Future.delayed(const Duration(seconds: 3));
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const HomePage()));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/france.png',
        width: 150,
        height: 150,
      ),
    );
  }
}
