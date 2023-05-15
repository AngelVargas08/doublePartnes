
import 'package:doublevpartners/domain/provider/form_provider.dart';
import 'package:doublevpartners/domain/util/formatDate.dart';
import 'package:flutter/material.dart';
import 'package:doublevpartners/config/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../widgets/Shared/shared.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;    
    return Scaffold(
      resizeToAvoidBottomInset: true,
        body: Stack(
        children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: CustomPaint(
            painter: HeaderPaintWaves(),
          ),
        ),
        Positioned(
          top: 30,
          child: IconButton(onPressed: () {
            GoRouter.of(context).pop();
          },
           icon: const Icon(Icons.arrow_back)),
        ),
         Padding(
           padding: const EdgeInsets.only(top: 100),
           child: SizedBox(
            width: size.width,
            height: size.height,
             child: const SingleChildScrollView(
              primary: true,
              child:  _BodyForm()),
           ),
         )
        ],
          ));
  }
}

class _BodyForm extends StatelessWidget {
  const _BodyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

      
    final signUp = context.watch<Formprovider>();
    return Padding(
      padding: const EdgeInsets.only(left: 60,right: 60, bottom: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: signUp.formKey2,
            autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text(
                'Personal information',
                style: TxtStyles.textStylewhite,
              ),
               TextForm(
                 onValue: (value) => signUp.email=value,
                validationemail: true,
                textInputType: TextInputType.name,
                text: 'Email',
                icon: Icons.email_outlined,
              ),
                TextForm(
                onValue: (value) => signUp.name=value,
                caracters: true,
                textInputType: TextInputType.name,
                text: 'Name',
                icon: Icons.person_3_outlined,
              ),
                TextForm(
                onValue: (value) => signUp.lastname=value,
                caracters: true,
                textInputType: TextInputType.name,
                text: 'Last Name',
                icon: Icons.person_3_outlined,
              ),
                TextForm(
                controller:signUp.dateTime!= null ? TextEditingController(text: formatdate(signUp.dateTime!)):null,
                textInputType: TextInputType.none,
                caracters: true,
                dateTime: true,
                text: 'Birthdate', 
                icon: Icons.calendar_month),
                 const TextForm(
                textInputType: TextInputType.text,
                obscureText: true,
                text: 'Password', 
                icon: Icons.lock_outline_rounded),

              const SizedBox(
                height: 20,
              ),
              const Text(
                'Personal information', 
                style: TxtStyles.textStylewhite,
              ),
             ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: signUp.addres.length,
              itemBuilder: (context, index) {
                 return   TextForm(
                  onValue: (value) => signUp.newaddAddres(index, value),
                  caracters: true,
                  textInputType: TextInputType.streetAddress,
                  text: 'Address ${index+1}', 
                  icon: Icons.house_siding_rounded);
              },
              ),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  ButtonCustom(
                    onPressed:() {
                      signUp.addAddres();
                    },
                    icon: Icons.add,
                    text: 'add',
                     color: const Color(0xffddc4fd), 
                     width: 0.2, 
                     height: 40
                     ),
                     const SizedBox(width: 10,),
                     ButtonCustom(
                      onPressed: () {
                        signUp.deleteAddres();
                      },
                    icon: Icons.delete,
                    text: 'delete',
                     color: const Color(0xffddc4fd), 
                     width: 0.2, 
                     height: 40
                     ),
                ],
              ),

             ButtonCustom(text: 'Check-in', 
             onPressed: (){
              if(signUp.isValidForm2()==true){
                    context.go('/homescreen');
              }
               
             },
              color: const Color(0xff6e79d2), 
              width: 0.8, 
              height: 60
              ),
              const SizedBox(height: 30,)
            ],
          )),
        ],
      ),
    );
  }
}
