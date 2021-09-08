import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';
import '../models/home_model.dart';
import '../widgets/wave_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    final myColor = Theme.of(context).primaryColor;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: myColor,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds:500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen?-size.height/3.4: 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.35,
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(
                    labelText: 'Email',
                    prefixIconData: Icons.email_outlined,
                    suffixIconData: model.isValid
                        ? Icons.check_circle_sharp
                        : Icons.radio_button_unchecked,
                    obsecureText: false,
                    onChanged: (value) {
                      model.isValidEmail(value);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldWidget(
                        labelText: 'Password',
                        prefixIconData: Icons.lock_outline,
                        suffixIconData: model.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obsecureText: model.isVisible ? false : true,
                        onChanged: () {}),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).primaryColor))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonWidget(title: 'Sign In', hasBorder: false),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(title: 'Sign Up', hasBorder: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
