import 'package:flutter/material.dart';

import '../models/global.dart';


  

Widget getTabContainer(String categoryName, int index) {

    final String heroTag = "btnTab$index";
    //print(heroTag);

    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 70),
      height: 120,
      width: 160,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 30.0,
            offset: Offset(0,20),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(categoryName, style: titileStyleLighterBlack),
          Container(
            height: 70,
            width: 100,
            child: FloatingActionButton(
              heroTag: heroTag,
              backgroundColor: Colors.white,
              child: tabCatToIcon[categoryName],
              elevation: 10,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getTabCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    int id = 0;
    for (String category in tabCategories) {
      if (i < 2) {
        rows.add(getTabContainer(category, id));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getTabContainer(category, id));
        i++;
      }
      id++;
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }
