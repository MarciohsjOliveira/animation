import 'package:animation/Component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState
    extends State<Home> //State já tem SingletickerProviderStateMixin
//sobrepoe  o metodo no vsync usando this
// sicronizando o calculo de frame
    with
        Component,
        SingleTickerProviderStateMixin {
  //Controlador de animação precisar dar dispose para não sobrecarregar a memoria
  AnimationController animationController;

  Animation<double> animLogo;
  Animation<double> animName;
  Animation<double> animPassword;
  Animation<double> animForget;
  Animation<double> animButtonCircular;
  Animation<double> animButtonWidth;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
  }

  //atualiza os valores assim não sobrecarrega o Build
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Interval possibilita ditar o tempo das animações
    animLogo = Tween<double>(begin: 0, end: 200.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.bounceInOut,
        )));
    animName = Tween<double>(begin: 0, end: 400.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    ));
    animPassword = Tween<double>(begin: 0, end: -400.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInCubic));
    //opacidade começa 1.0
    animForget = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animButtonCircular =
        Tween<double>(begin: 8.0, end: 40.0).animate(animationController);
    animButtonWidth = Tween<double>(begin: 400, end: 50.0).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.elasticInOut));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _ontap() {
    if (animationController.value > 0) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  Widget _collumn() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
            animation: animLogo,
            child: logo(),
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(0.0, animLogo.value),
                child: child,
              );
            }),
        AnimatedBuilder(
            animation: animName,
            child: loginName(),
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(animName.value, 0.0),
                child: child,
              );
            }),
        AnimatedBuilder(
            animation: animPassword,
            child: password(),
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(animPassword.value, 0.0),
                child: child,
              );
            }),
        AnimatedBuilder(
            animation: animForget,
            child: forgetPassWord(),
            builder: (BuildContext context, Widget child) {
              return Opacity(child: child, opacity: animForget.value);
            }),
        AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return buttonLogin(
                onTap: _ontap,
                width: animButtonWidth.value,
                circular: animButtonCircular.value,
                isLoading: animButtonCircular.value > 8.0,
              );
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Stack(
                //alignment: Alignment.bottomCenter,
                children: <Widget>[
                  _collumn(),
                ],
              ),
            ),
          ),
        ));
  }
}
