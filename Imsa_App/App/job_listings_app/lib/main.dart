import 'package:flutter/material.dart';
import 'models/job.dart';

import 'models/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(40),
                    constraints: BoxConstraints.expand(height: 180),
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [lightBlueIsh, lightGreen],
                            begin: const FractionalOffset(1.0, 1.0),
                            end: const FractionalOffset(0.2, 0.2),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'IMSA Care',
                            style: titleStyleWhite,
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Text(
                            "Explore Donation Opportunities",
                            style: titileStyleBlack,
                          ),
                        ),
                        Container(
                          height: 600,
                          child: ListView(
                            children: getJobCategories(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> jobCategories = [
    "Zakat Maal",
    "Shodaqoh",
    "Alim Scholarship",
    "Ceria Scholarship",
    "IMSA Donation",
    "Wakaf Al-Qur'an",
    "Wakaf Jembatan",
    "COVID-19",
    "Relief Fund",
    "Humanitarian Fund"
  ];

  Map jobCatToIcon = {
    "Zakat Maal": Icon(Icons.monetization_on, color: lightBlueIsh, size: 50),
    "Shodaqoh": Icon(Icons.spa, color: lightBlueIsh, size: 50),
    "Alim Scholarship": Icon(Icons.filter_vintage, color: lightBlueIsh, size: 50),
    "Ceria Scholarship": Icon(Icons.all_inclusive, color: lightBlueIsh, size: 50),
    "IMSA Donation": Icon(Icons.account_balance, color: lightBlueIsh, size: 50),
    "Wakaf Al-Qur'an": Icon(Icons.library_books, color: lightBlueIsh, size: 50),
    "Wakaf Jembatan": Icon(Icons.subway, color: lightBlueIsh, size: 50),
    "COVID-19": Icon(Icons.bug_report, color: lightBlueIsh, size: 50),
    "Relief Fund": Icon(Icons.healing, color: lightBlueIsh, size: 50),
    "Humanitarian Fund": Icon(Icons.favorite, color: lightBlueIsh, size: 50),
  };

  Widget getCategoryContainer(String categoryName) {
    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(categoryName, style: titileStyleLighterBlack),
          Container(
            //padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: jobCatToIcon[categoryName],
              elevation: 10,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category));
        i++;
      }
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }
}
