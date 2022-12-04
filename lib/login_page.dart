//Note: Check out the input fields and its behaviors when you:
//Enter a wrong password, email or left everything blank
//Google and Phone login I did not finished
//Reason: Google API Integration errors and time waste
//Google and Phone Authentication buttons just send you to the Main Page screen


import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_page.dart';


const users = const {
  'tech387@gmail.com': '12345',
  'product-arena@gmail.com': 'nihad',
  'sarajevo387@gmail.com': 'flutter',
  'internship@gmail.com': 'signmeup',
  'career@tech387.com': 'Pass123!',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FlutterLogin(
          logo: NetworkImage('https://user-images.githubusercontent.com/76163793/205487416-8f77bc0a-d98f-4ac6-8274-70cb5546a52c.png'),
          onLogin: _authUser,
          onSignup: _signupUser,

          loginProviders: <LoginProvider>[
            LoginProvider(
              icon: FontAwesomeIcons.google,
              callback: () async {
                debugPrint('start google sign in');
                await Future.delayed(loginTime);
                debugPrint('stop google sign in');
                return null;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.phone,
              callback: () async {
                debugPrint('start phone sign in');
                await Future.delayed(loginTime);
                debugPrint('stop phone sign in');
                return null;
              },
            ),
          ],
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MainPage(),
            ));
          },
          onRecoverPassword: _recoverPassword,
        ),
      ),
    );
  }
}