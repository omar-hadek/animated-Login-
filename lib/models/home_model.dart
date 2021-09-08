import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier{
  List emails = ['omar@hmail.com'];
  get isVisible => _isVisible;
  bool _isVisible  = false;
  set isVisible(value){
    _isVisible  = value;
    notifyListeners();

  }



  get isValid => _isValid;
  bool _isValid = false;


  void isValidEmail(String input){
    if(input == emails.first){
      _isValid = true;
    }else{
      _isValid = false;
    }
    notifyListeners();

  }
}