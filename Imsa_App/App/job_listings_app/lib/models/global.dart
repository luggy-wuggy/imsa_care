import 'package:flutter/material.dart';


const Color lightGreen = Color(0xFF95E08E);
const Color lightBlueIsh = Color(0xFF33BBB5);
const Color darkGreen = Color(0xFF00AA12);
const Color backgroundColor = Color(0xFFEFEEF5);

List<String> tabCategories = [
    "Home",
    "Activities",
    "About",
    "IMSA TV",
    "Donate",
    "Chat",
    'Settings',
  ];

  Map tabCatToIcon = {
    "Home": Icon(Icons.home, color: lightBlueIsh, size: 50),
    "Activities": Icon(Icons.today, color: lightBlueIsh, size: 50),
    "About": Icon(Icons.spa, color: lightBlueIsh, size: 50),
    "IMSA TV": Icon(Icons.ondemand_video, color: lightBlueIsh, size: 50),
    "Donate": Icon(Icons.favorite, color: lightBlueIsh, size: 50),
    "Chat": Icon(Icons.question_answer, color: lightBlueIsh, size: 50),
    "Settings": Icon(Icons.build, color: lightBlueIsh, size: 50),
  };

final Map donateDescriptions = {
    "Zakat Maal": "Zakat is an Islamic finance term referring to the obligation that an individual has to donate a certain proportion of wealth each year to charitable causes. Zakat is a mandatory process for Muslims and is regarded as a form of worship. Giving away money to the poor is said to purify yearly earnings that are over and above what is required to provide the essential needs of a person or family.",
    "Shodaqoh": 'null',
    "Alim Scholarship": 'null',
    "Ceria Scholarship": 'null',
    "IMSA Donation": 'null',
    "Wakaf Al-Qur'an": 'null',
    "Wakaf Jembatan": 'null',
    "COVID-19": 'null',
    "Relief Fund": 'null',
    "Humanitarian Fund": 'null',
    
  };

final Map donateCatToIcon = {
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

List<String> donateCategories = [
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

final List donationAmount = [
  '\$20',
  '\$25',
  '\$50',
  '\$75',
  '\$100',
  '\$250',
  '\$500',
];

TextStyle mainTitleStyleWhite = new TextStyle(
  fontFamily: 'Helvetica', 
  color: Colors.white, 
  //fontWeight: FontWeight.bold, 
  fontSize: 65
);

TextStyle titleStyleWhite = new TextStyle(
  fontFamily: 'Helvetica', 
  color: Colors.white, 
  //fontWeight: FontWeight.bold, 
  fontSize: 45
);
TextStyle jobCardTitileStyleBlue = new TextStyle(
  fontFamily: 'Avenir', 
  color: lightBlueIsh, 
  fontWeight: FontWeight.bold, 
  fontSize: 12
);
TextStyle jobCardTitileStyleBlack = new TextStyle(
  fontFamily: 'Avenir', 
  color: Colors.black, 
  fontWeight: FontWeight.bold, 
  fontSize: 12
);
TextStyle titileStyleLighterBlack = new TextStyle(
  fontFamily: 'Avenir', 
  color: Color(0xFF34475D), 
  fontWeight: FontWeight.bold, 
  fontSize: 20
);

TextStyle titileStyleBlack = new TextStyle(
  fontFamily: 'Helvetica', 
  color: Colors.black, 
  fontWeight: FontWeight.bold, 
  fontSize: 20
);
TextStyle salaryStyle = new TextStyle(
  fontFamily: 'Avenir', 
  color: darkGreen, 
  fontWeight: FontWeight.bold, 
  fontSize: 12
);






