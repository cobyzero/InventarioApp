import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:inventarioapp/Views/mainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Row(
        children: [left(), Right()],
      ),
    ));
  }

  Expanded left() {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.flutter_dash,
                size: 60,
              ),
              const Text(
                "Sign in",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(onPressed: () {}, child: const Text("Sign up"))
                ],
              ),
              space(h: 20),
              MyTextFormField(
                controller: email,
                text: "Email*",
              ),
              space(h: 20),
              MyTextFormField(
                controller: password,
                text: "Password*",
              ),
              space(
                h: 20,
              ),
              TextButton(onPressed: () {}, child: const Text("Forgot password?")),
              space(
                h: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.only(
                        left: 118,
                        right: 118,
                        top: 17,
                        bottom: 17,
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                  },
                  child: FadeIn(
                    duration: const Duration(seconds: 3),
                    child: const Text("Sign in"),
                  ))
            ],
          ),
        ],
      ),
    ));
  }

  Expanded Right() {
    return Expanded(
        child: Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(50),
      color: Color(0xff1E293B),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to our Comumunity",
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              space(h: 10),
              const Text(
                "Fuse helps developers to build organized and well coded dashboards full of beautiful and rich modules. Join us and start building your application today.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
