 import 'package:flutter/material.dart';


import 'package:job_listings_app/donation_screen.dart';
import 'package:job_listings_app/models/global.dart';

class DonationContainer extends StatelessWidget {

  final String _donationName;
  final int _index;


  DonationContainer(this._donationName, this._index);

  @override
  Widget build(BuildContext context) {

    final String heroTag = 'btn$_index';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(child: Text(_donationName, style: titileStyleLighterBlack)),
          Container(
            //padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child: FloatingActionButton(
              heroTag: heroTag,
              backgroundColor: Colors.white,
              child: donateCatToIcon[_donationName],
              elevation: 10,
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) {
                    return DonationScreen(_donationName);
                  }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> getDonateCategories() {
  List<Widget> jobCategoriesCards = [];
  List<Widget> rows = [];
  int i = 0;
  int id = 0;
  for (String category in donateCategories) {
    if (i < 2) {
      rows.add(DonationContainer(category, id));
      i++;
    } else {
      i = 0;
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
      rows = [];
      rows.add(DonationContainer(category, id));
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