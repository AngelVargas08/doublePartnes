
import 'package:doublevpartners/domain/provider/form_provider.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:doublevpartners/config/theme/app_theme.dart';
import 'package:provider/provider.dart';
import '../widgets/Shared/shared.dart';



class Signinscreen extends StatelessWidget {
  const Signinscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.70,
                  child: CustomPaint(
                    painter: HeaderPaintWaves(),
                  ),
                ),
                const _Customform(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'or connect with',
                style: TxtStyles.textStylegrey,
              ),
            ),
           const _Networksbuttons(),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  const Text('Dont have account?',
                      style: TxtStyles.textStylegrey,),
                     
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/signupscreen');
                      },
                      child: const Text('Sign up',
                          style: TextStyle(fontSize: 15, color: Colors.blue)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Networksbuttons extends StatelessWidget {
  const _Networksbuttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        ButtonCustom(
          icon: Icons.facebook,
          text: 'Facebook',
          color: Color(0xff34a2f1),
          height: 50,
          width: 0.4,
          onPressed: () {
            
          },
        ),
        ButtonCustom(
          icon: Icons.facebook,
          text: 'Twiter',
          color: Color(0xff5273ba),
          height: 50,
          width: 0.4,
          onPressed: () {
            
          },
        )
      ],
    );
  }
}

class _Customform extends StatelessWidget {
  const _Customform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signIn = context.watch<Formprovider>();
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 70, right: 70),
      child: Column(
        children:  [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: signIn.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
            children: [
             TextForm( 
            onValue: (value) => signIn.email=value,
            textInputType: TextInputType.emailAddress,
            validationemail: true,
            text: 'Email',
            icon: Icons.person_2_outlined,
            
          ),
            TextForm(
              onValue: (value) => signIn.password=value,
            textInputType:TextInputType.text ,
            obscureText: true,
            text: 'Password',
            icon: Icons.lock_outline_rounded,
          ),

           const SizedBox(height: 20),
           ButtonCustom(
            onPressed: () {
              signIn.isValidForm();
            },
            text: 'Login',
            color: const Color(0xff6e79d2),
            height: 60,
            width: 0.8,
          ),
            ],
          )),
          
          const SizedBox(height: 20),
          const Text(
            'Forgot your password?',
            style: TxtStyles.textStylewhite,
          )
        ],
      ),
    );
  }
}
