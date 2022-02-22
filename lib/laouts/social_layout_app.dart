import 'package:chat/laouts/NewPosts/NewPosts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
        listener: (context, state) {
          if (state is SocialNewPostStates)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewPosts()));
        },
        builder: (context, state) {
          var C = SociallCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Theme.of(context).bottomAppBarColor,
              title: Text(C.titles[C.currrentIndex].toString()),
            ),
            body: C.list[C.currrentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              index: C.currrentIndex,
              onTap: (index) {
                SociallCubit.get(context).ChangeBottomNav(index);
              },
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              items: const [
                Icon(Icons.home),
                Icon(Icons.chat),
                Icon(Icons.upload_rounded),
                Icon(Icons.group),
                Icon(Icons.settings),
              ],
            ),
          );
        },
      ),
    );
  }
}
/*
/*BottomNavigationBarItem(
                  icon: const Icon(Icons.chat),
                  label: C.titles[C.currrentIndex].toString(),
                  backgroundColor: Colors.orange,
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.upload_rounded),
                  label: 'Add Post',
                  backgroundColor: Colors.orange,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.group),
                  label: C.titles[C.currrentIndex].toString(),
                  backgroundColor: Colors.orange,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: C.titles[C.currrentIndex].toString(),
                  backgroundColor: Colors.orange,
                ),*/

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
