import 'package:flutter/material.dart';
import 'package:news_app_with_newsapi/Pages/HomePage/breaking_news.dart';
import 'package:news_app_with_newsapi/Pages/HomePage/recommendation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Lazy News",
          style: TextStyle(
              color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Transform.scale(
              scale: 0.75,
              child: CircleAvatar(
                child: Icon(Icons.menu, size: 35),
                backgroundColor: Colors.white, //grey.shade100,
                foregroundColor: Colors.black,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(children: [
              CircleAvatar(
                child: Icon(Icons.search, size: 22),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                child: Icon(Icons.notifications_outlined, size: 22),
                backgroundColor: Colors.white, //grey.shade100
                foregroundColor: Colors.black,
              )
            ]),
          )
        ],
      ),
      drawer: Drawer(),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 1500));
        },
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [BreakingNews(), Recommendation()])),
      ),
    );
  }
}
