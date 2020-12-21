import 'package:flutter/material.dart';

class Component {
  Widget logo({height: 200.0, width = 300.0, scale: 0.3}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 50.0),
      child: Image.asset(
        "images/one.png",
        scale: scale,
        height: height,
        width: width,
      ),
    );
  }

  Widget loginName() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Name",
        ),
      ),
    );
  }

  Widget password() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 10),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Password",
        ),
      ),
    );
  }

  Widget forgetPassWord({color: Colors.grey, fontSize: 16.0}) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 8, bottom: 20),
        child: Center(
          child: Text(
            'Forget Password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              decoration: TextDecoration.underline,
              letterSpacing: 3,
              wordSpacing: 2.0,
              color: color,
            ),
          ),
        ));
  }

  Widget buttonLogin(
      {bool isLoading = false,
      double circular = 8.0,
      double width = 400,
      double height = 50,
      Function onTap,
      EdgeInsets padding = const EdgeInsets.only(
        right: 30.0,
        left: 30.0,
        top: 70,
        bottom: 70,
      )}) {
    _loading() {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    _text() {
      return Text(
        "Login",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circular),
            color: Colors.redAccent.withAlpha(250),
          ),
          alignment: Alignment.center,
          child: isLoading ? _loading() : _text(),
        ),
      ),
    );
  }
}
