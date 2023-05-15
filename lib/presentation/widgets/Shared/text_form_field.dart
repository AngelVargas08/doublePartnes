import 'package:doublevpartners/domain/provider/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextForm extends StatelessWidget {
  final String text;
  final String? value;
  final IconData icon;
  final bool? obscureText;
  final bool? validationemail;
  final bool? dateTime;
  final bool? caracters;
  final TextInputType textInputType;
  final ValueChanged<String>? onValue;
  final ValueChanged<String>? validation;
  final TextEditingController? controller;
  const TextForm(
      {super.key,
      required this.text,
      required this.icon,
      this.obscureText = false,
      this.validationemail = false,
      this.dateTime = false,
      this.caracters,
      required this.textInputType,
      this.onValue,
      this.validation, this.value, this.controller});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white),
    );
    final textform = context.watch<Formprovider>();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText!,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
            hintText: text,
            //label: ,
            prefixIcon: Icon(icon),
          ),
          onTap: () {
            if (dateTime == true) {
              showDatePicker(
                context: context,
                initialDate: textform.dateTime?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (context, child) {
                  return Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                        primary: Color(0xFF00C0E4),
                      )),
                      child: child!);
                },
              ).then((value) {
                if(value!=null){
                  textform.changeDatatimer(value);
                  
                }

              });
            }
          },
          onChanged: onValue,
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = RegExp(pattern);
            if (value != null && validationemail == true) {
              return regExp.hasMatch(value)
                  ? null
                  : 'what you are entering does not look like an email';
            }
            if (value != null && obscureText == true && value.length <= 6) {
              return 'The password must have a minimum of six characters';
            }

            if (value != null && caracters == true && value.length <= 3) {
              return 'Invalid number of characters';
            }

            return null;
          }),
    );
  }
}
