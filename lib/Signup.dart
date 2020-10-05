import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool accept = false;

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
              margin: EdgeInsets.only(top: 3),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text(
              'Back',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget form(String title, {bool isPassword = false}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            child: TextFormField(
              onSaved: (value) => title = value,
              style: TextStyle(
                fontSize: 16,
              ),
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
                      color: Colors.orangeAccent,
                    ),
                  ),
                  filled: true),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget submitButton(String title) {
    return RaisedButton(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.orangeAccent,
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
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.orange[100],
    );
  }

  Widget loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sudah mempunyai akun? ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: Login(),
                  type: PageTransitionType.fade,
                  inheritTheme: true,
                  ctx: context,
                ),
              );
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  Widget signupform() {
    return Column(
      children: <Widget>[
        form("Nama Lengkap"),
        form("Email"),
        form("Password", isPassword: true),
        form("Konfirmasi Password", isPassword: true),
      ],
    );
  }

  Widget title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "DAFTAR AKUN",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Color(0xff333333),
          shadows: [
            Shadow(
              offset: Offset(0.00, 2.00),
              color: Color(0xffd97c29).withOpacity(0.50),
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String tnc =
        'Dengan ini saya telah membaca dan menyetujui Malioboro Mall Shop & Deals Privacy Policy, T&C, dan ToS.';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 40,
            left: 0,
            child: backButton(),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.6, 0.9],
                colors: [
                  Colors.white,
                  Color(0xfffed8b1),
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  title(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  signupform(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                            activeColor: Colors.orangeAccent,
                            value: accept,
                            onChanged: (bool value) {
                              setState(() {
                                accept = value;
                              });
                            }),
                        Expanded(
                          child: Text(tnc, textAlign: TextAlign.justify),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  submitButton('SUBMIT'),
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: loginAccountLabel(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
