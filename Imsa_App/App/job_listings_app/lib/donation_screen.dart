import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import './models/global.dart';

class DonationScreen extends StatefulWidget {
  final String _donationName;

  DonationScreen(this._donationName);

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;


  void _pay(){
    InAppPayments.setSquareApplicationId('sq0csp-m8CC6JTsaOQfHNTGw-850Cu06nW9XmU2NCO9_HK4aKQ');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
      onCardEntryCancel: (){} ,//Don't do anything when card cancels
    );

  }

  void _cardNonceRequestSuccess(CardDetails result){
    print(result.nonce);

    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete(){
    //success
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
    //_pay();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    //_pay();
  }

  Widget _animatedButtonUI({
    @required String title,
    @required double height,
    @required double width,
    Color firstColor = lightBlueIsh,
    Color secondColor = lightGreen,
  }) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10, bottom: 40),
      child: Center(
          child: Text(
        title,
        style: titileStyleLighterBlack,
      )),
      decoration: BoxDecoration(
        gradient: new LinearGradient(
            colors: [firstColor, secondColor],
            begin: const FractionalOffset(0.5, 2.0),
            end: const FractionalOffset(0.2, 0.2),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey[400],
            blurRadius: 10.0,
            offset: Offset(3, 5)

          ),
        ],
      ),
    );
  }

  void _showDonationAmount() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                style: BorderStyle.solid,
                color: lightBlueIsh,
                width: 5,
              ),
            ),
            title: Text("Select an amount"),
            content: SingleChildScrollView(
              child: Container(
                //color: Colors.red,
                height: 381,
                width: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10),
                        children: List.generate(7, (index) {
                          return Container(
                            //color: Colors.red,
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.all(5),
                            child: RaisedButton(
                              color: Colors.grey[100],
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: lightGreen,
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () {},
                              child: Text('${donationAmount[index]}'),
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 20,
                        child: Container(
                            width: 160,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration:
                                  InputDecoration(labelText: 'other amount'),
                              cursorColor: lightBlueIsh,
                            )),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTapDown: _onTapDown,
                          onTapUp: _onTapUp,
                          child: Transform.scale(
                            scale: _scale,
                            child: _animatedButtonUI(
                              title: 'Cancel',
                              height: 45,
                              width: 120,
                              firstColor: Colors.amberAccent,
                              secondColor: Colors.deepOrange[800],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTapDown: _onTapDown,
                          onTapUp: _onTapUp,
                          onTap: _pay,
                          child: Transform.scale(
                            scale: _scale,
                            child: _animatedButtonUI(
                            title: 'Next', height: 45, width: 120),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

 
  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

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
                      padding: EdgeInsets.only(top: 30),
                      child: FittedBox(
                        child: Text(
                          widget._donationName,
                          style: titleStyleWhite,
                        ),
                      )
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left,
                          color: lightBlueIsh, size: 50),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                height: 400,
                width: 350,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Description',
                      style: titileStyleLighterBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(donateDescriptions['${widget._donationName}']),
                  ],
                ),
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
              ),
              GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                onTap: _showDonationAmount,
                child: Transform.scale(
                  scale: _scale,
                  child: _animatedButtonUI(
                      title: 'Make donation', height: 60, width: 200),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
