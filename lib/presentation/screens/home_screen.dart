import 'package:doublevpartners/domain/provider/form_provider.dart';
import 'package:doublevpartners/domain/util/formatDate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeprovider = context.watch<Formprovider>();

    return Scaffold(
      body: Center(
          child: Expanded(
        child: Container(
          width: size.width * 0.85,
          height: size.height * 0.3,
          decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Información',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.purple[200],
                      child: Image.asset('assets/uni.png'),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${homeprovider.name}'),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('Lastname: ${homeprovider.lastname}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('Email: ${homeprovider.email}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                              'Date: ${formatdate(homeprovider.dateTime!)}'),
                        ),
                        
                      ],
                    )
                  ],
                ),
                
              ),
              Expanded(
                child: SizedBox(
                            width: size.width*0.5,
                            height: size.height,
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: homeprovider.addres.length,
                              itemBuilder: (context, index) {
                                final data = homeprovider.addres[index];
                                return Row(
                                  children: [
                                    Text('Direccion ${index + 1} '),
                                    Text(data.address!)
                                  ],
                                );
                              },
                            ),
                          ),
              )
            ],
            
          ),
        ),
      )),
    );
  }
}
