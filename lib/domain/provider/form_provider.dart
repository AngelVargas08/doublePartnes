import 'package:flutter/material.dart';

import 'package:doublevpartners/domain/models/user.dart';


class Formprovider extends ChangeNotifier{


GlobalKey<FormState> formKey = GlobalKey<FormState>();
GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

String email = '';
String password = '';
String lastname = '';
String name = '';
final int counter = 0;
DateTime? dateTime;

List<Address> addres = [Address(address: null, )];


void addAddres (){
    addres+=[Address(address: null, )];
  notifyListeners();
}

void newaddAddres (int index, String value){
    addres[index] = Address(address:value);
    
  notifyListeners();
}
void deleteAddres (){
  if(addres.length>1){
    addres.removeLast();
  }
  notifyListeners();
}

bool isValidForm(){
      return formKey.currentState?.validate() ?? false;
      
}
bool isValidForm2(){
      return formKey2.currentState?.validate() ?? false;
      
}

void changeDatatimer(DateTime date){

    dateTime = date;
      notifyListeners();

}


}