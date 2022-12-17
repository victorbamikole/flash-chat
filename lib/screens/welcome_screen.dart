import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/components/round_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation borderAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);
    controller.forward();
    borderAnimation = BorderRadiusTween(
            begin: BorderRadius.all(Radius.circular(5)),
            end: BorderRadius.all(Radius.circular(30)))
        .animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  Widget animateText() {
    return Expanded(
      child: SizedBox(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Flash Chat'),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                animateText(),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Log in',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
