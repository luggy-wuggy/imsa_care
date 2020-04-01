import 'package:flutter/material.dart';
import 'donation_screen.dart';
import 'models/job.dart';

import './models/global.dart';
import './widget/tab.dart';
import './widget/tab_categories/donation.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

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
              //App Bar Title
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
                      //color: Colors.red,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'IMSA',
                            style: mainTitleStyleWhite,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Horizontal Tab List Scroll
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    constraints: BoxConstraints.expand(height:200),
                    child: ListView(
                      padding: EdgeInsets.only(left: 40),
                      scrollDirection: Axis.horizontal,
                      children: getTabCategories()
                    ),
                  ),
                  // Trigger Tab Scren (Currently Only Donation )
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40, left: 34),
                          child: Text(
                            "Explore Donation Opportunities",
                            style: titileStyleBlack,
                          ),
                        ),
                        Container(
                          height: 450,
                          child: ListView(
                            children: getDonateCategories(),
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

}


