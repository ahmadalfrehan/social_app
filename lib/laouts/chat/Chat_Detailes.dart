import 'package:chat/laouts/Cubit/cubit.dart';
import 'package:chat/laouts/Cubit/states.dart';
import 'package:chat/modulo/chatModel.dart';
import 'package:chat/modulo/usersmoder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailes extends StatelessWidget {
  UsersModel users;

  ChatDetailes(this.users);

  @override
  Widget build(BuildContext context) {
    Size S = MediaQuery.of(context).size;
    var chatTextControoler = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SociallCubit()
        ..getUsers()
        ..getMessages(
          reciverID: users.uId.toString(),
        ),
      child: Builder(
        builder: (BuildContext context) {
          if (SociallCubit.get(context).UU == null)
            SociallCubit.get(context).getUsers();
          else {
            SociallCubit.get(context).getMessages(
              reciverID: users.uId.toString(),
            );
          }
          return BlocConsumer<SociallCubit, SocialStates>(
            listener: (context, state) {},
            builder: (context, state) {
              SociallCubit.get(context).getMessages(
                  reciverID: users.uId.toString(),
              );
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  elevation: 0,
                  titleSpacing: 0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(users.ImageProfile.toString()),
                      ),
                      SizedBox(
                        width: S.width * 0.01,
                      ),
                      Text(users.name.toString()),
                    ],
                  ),
                  toolbarHeight: S.height * 0.08,
                ),
                body: SociallCubit.get(context).messages.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemCount:
                                    SociallCubit.get(context).messages.length,
                                separatorBuilder: (context, index) => Divider(),
                                itemBuilder: (context, index) {
                                  var t =
                                      SociallCubit.get(context).messages[index];
                                  if (SociallCubit.get(context).UU!.uId ==
                                      t.SenderID) {
                                    return MyMessage(t);
                                  }
                                  return HisMessage(t);
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "trype your message here ..",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    controller: chatTextControoler,
                                  ),
                                ),
                                SizedBox(
                                  width: S.width * 0.01,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: MaterialButton(
                                    minWidth: S.width * 0.01,
                                    onPressed: () {
                                      SociallCubit.get(context).SendMessaege(
                                        reciverID: users.uId as String,
                                        text: chatTextControoler.text,
                                        dateTime: DateTime.now().toString(),
                                      );
                                    },
                                    child: const Icon(Icons.send_rounded),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }

  Widget MyMessage(ChatModel t) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(t.text.toString()),
        ),
      );

  Widget HisMessage(ChatModel t) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(t.text.toString()),
        ),
      );
}
