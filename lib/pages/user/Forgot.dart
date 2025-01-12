import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Login.dart';

class Forgot extends StatefulWidget {
  Forgot({Key key}) : super(key: key);
  static final String route = 'Forgot-route';

  @override
  ForgotState createState() => ForgotState();
}

class ForgotState extends State<Forgot> {
  Widget backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text(
              'Back',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget form(String title, {bool isPassword = false}) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            child: TextFormField(
              onSaved: (value) => title = value,
              style: TextStyle(color: Colors.black, fontSize: 18),
              obscureText: isPassword,
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: title,
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.brown,
                  ),
                ),
                filled: true,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget resetButton(String title) {
    return RaisedButton(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.brown,
          width: 1,
        ),
      ),
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 50,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            child: Login(),
            type: PageTransitionType.fade,
            inheritTheme: true,
            ctx: context,
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Color(0xfffee18e),
    );
  }

  Widget resetform() {
    return Column(
      children: <Widget>[
        form("Email"),
      ],
    );
  }

  Widget title() {
    return Text(
      'Oops, I Forgot My Password!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 26,
        color: Colors.black,
        shadows: [
          Shadow(
            offset: Offset(0.00, 2.00),
            color: Colors.brown.withOpacity(0.50),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.8],
                colors: [
                  Colors.white,
                  Color(0xfffee18e),
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                title(),
                SizedBox(
                  height: 50,
                ),
                resetform(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                      'Please provide your registered email to recover the password.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify),
                ),
                SizedBox(
                  height: 30,
                ),
                resetButton('RESET'),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: backButton(),
          ),
        ],
      ),
    );
  }
}
