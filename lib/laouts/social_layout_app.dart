import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SociallCubit()..getUsers(),
      child: BlocConsumer<SociallCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var C = SociallCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              //backgroundColor: Colors.white,
              title:Text(C.titles[C.currrentIndex].toString()),
            ),
            body: C.list[C.currrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: C.currrentIndex,
              onTap: (index) {
                SociallCubit.get(context).ChangeBottomNav(index);
              },
              selectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: C.titles[C.currrentIndex].toString(),
                  backgroundColor: Colors.orange,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: C.titles[C.currrentIndex].toString(),
                  backgroundColor: Colors.orange,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: C.titles[C.currrentIndex].toString(),
                  backgroundColor: Colors.orange,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: C.titles[C.currrentIndex].toString(),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
/*
*  Column(
              children: [
                SociallCubit.get(context).UU == null
                    ? const Center(
                        child: LinearProgressIndicator(),
                      )
                    : FirebaseAuth.instance.currentUser!.emailVerified
                        ? Container(
                            height: 60,
                            color: Colors.amber.withOpacity(0.2),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 12, left: 12),
                              child: Row(
                                children: [
                                  const Icon(Icons.info_outline),
                                  const Expanded(
                                    child: Text('  please verify your email '),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.currentUser!
                                          .sendEmailVerification();
                                    },
                                    child: const Text('Send'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        :
* */