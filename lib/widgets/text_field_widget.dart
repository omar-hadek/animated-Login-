import 'package:animated_login_app/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final bool obsecureText;
  final Function  onChanged;

  const TextFieldWidget(
      {required this.labelText,
      required this.prefixIconData,
      required this.suffixIconData,
      required this.obsecureText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return TextField(
      onChanged:(value) => onChanged(value),
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 18.0,
      ),
      cursorColor: Theme.of(context).primaryColor,
      obscureText: obsecureText,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize:16.0,
          ),
          prefixIcon: Icon(
            prefixIconData,
            size: 23,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap:(labelText == 'Password')?(){
              model.isVisible = !model.isVisible;
            }: (){},
            child: Icon(
              suffixIconData,
              size: 20.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
    );
  }
}
