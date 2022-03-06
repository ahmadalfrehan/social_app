import 'package:chat/modulo/usersmoder.dart';
import 'package:flutter/material.dart';
import 'package:chat/laouts/Cubit/cubit.dart';
import 'package:chat/laouts/Cubit/states.dart';
import 'package:chat/modulo/PostModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Chat_Detailes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SociallCubit()..getUsersAll(),
      child: BlocConsumer<SociallCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SocialGetAllUserLoadingStates) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: SociallCubit.get(context).users.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => INK(
              SociallCubit.get(context).users[index],
              context,
            ),
          );
        },
      ),
    );
  }

  Widget INK(UsersModel users, context) => InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatDetailes(users)));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [

              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(users.ImageProfile.toString()),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                users.name.toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
