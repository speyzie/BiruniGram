import 'package:akademi3/screens/login_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final String title = "Ana Sayfa";
  final String userName;
  const HomeView({super.key, required this.userName});
  @override
  State<HomeView> createState() => _MyAppState();
}

class _MyAppState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('BiruniGram'),
            elevation: 0,
            foregroundColor: Colors.purple,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            padding: EdgeInsets.only(top: 32),
            itemCount: 12,
            itemBuilder: (ctx, i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage('https://picsum.photos/${i}00'),
                        ),
                      ),
                      Text(
                        'BiruniGram Kullanıcısı',
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                  Image.network('https://picsum.photos/${i}00',
                      fit: BoxFit.cover, width: 500),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  )
                ],
              );
            },
          ),
        ));
  }
}
