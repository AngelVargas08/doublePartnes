import 'package:doublevpartners/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:doublevpartners/presentation/widgets/Shared/button.dart';



class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
              colors: [
            Color(0xffddc4fd),
            Color(0xff90c5fb),
              ], 
              begin: Alignment.topCenter, end: Alignment.bottomCenter
              )
              ),
              child: Column(
               
                children:  [
                    Expanded(
                      child: Container(
                        //color: Colors.amber,
                        width: size*0.5,
                      
                        child: FadeInDown(
                      duration: const Duration(seconds: 2),
                      child: Image.asset('assets/uni.png',)
                      ),
                      ),
                    ),
                  
                  Container(
                    width: double.infinity,
                    height: size*0.65,
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: const[
                         Text('Welcome!', style: TextStyle(fontSize: 50, color: Colors.white),),
                         Padding(
                          
                           padding: EdgeInsets.symmetric(horizontal: 30),
                           child: Text('Ullamco reprehenderit adipisicing do aute consectetur mollit exercitation irure. Sunt ullamco aliquip aliqua mollit eu proident ut pariatur fugiat cillum. Elit ad aliqua enim laborum voluptate. ',
                           style: TextStyle(fontSize: 15, color: Colors.white, ),
                           textAlign: TextAlign.justify,
                           ),
                         ),
                         _Buttons()

                      ],
                    ),
                  )
                ],
              ),
        )
      ],
    ));
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonCustom(
      text: 'log in', 
      color: const Color(0xff34a2f1),
       width: 0.3, 
       height: 50, 
       onPressed: () => GoRouter.of(context).push('/signinscreen')
       ),
       ButtonCustom(
      text: 'Sign up', 
      color: const Color(0xff5273ba),
       width: 0.3, 
       height: 50, 
       onPressed: () => GoRouter.of(context).push('/signupscreen')
       )
      ],
    );
  }
}
