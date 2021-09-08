import 'package:animated_login_app/models/home_model.dart';
import 'package:animated_login_app/widgets/button_widget.dart';
import 'package:animated_login_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextFieldWidget(
                labelText: 'Email',
                prefixIconData: Icons.email_outlined,
                suffixIconData: model.isValid? Icons.check_circle_sharp : Icons.radio_button_unchecked,
                obsecureText: false,
                onChanged:(value){
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
                    suffixIconData: model.isVisible ? Icons.visibility: Icons.visibility_off,
                    obsecureText:  model.isVisible? false: true,
                    onChanged: (){}
                   ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Forgot Password ?',
                    style: TextStyle(
                        fontSize: 16.0, color: Theme.of(context).primaryColor))
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
    );
  }
}
