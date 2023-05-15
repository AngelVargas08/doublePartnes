
import 'package:doublevpartners/domain/provider/form_provider.dart';
import 'package:doublevpartners/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget with RouterMixin{
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => Formprovider(),
      child:  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routerConfig: router,
      ),
    );
  }
}