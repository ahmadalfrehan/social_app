import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SociallCubit(),
        child: BlocConsumer<SociallCubit, SocialStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(),
                body: Center(child: MaterialButton(
                  onPressed: (){
                    SociallCubit.get(context).getUsers();

                  },
                  child: Text('GEEEEEEEEEEEEt'),
                ),

                ),
              );
            },),);
  }
}
