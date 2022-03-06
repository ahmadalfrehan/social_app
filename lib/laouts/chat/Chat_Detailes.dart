import 'package:chat/laouts/Cubit/cubit.dart';
import 'package:chat/laouts/Cubit/states.dart';
import 'package:chat/modulo/chatModel.dart';
import 'package:chat/modulo/usersmoder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailes extends StatelessWidget {
  UsersModel users;
  ChatDetailes(this.users);
  var chatTextControoler = TextEditingController();
  final ScrollController controllerScrol = ScrollController();
  void scrollSown(){
    controllerScrol.jumpTo(controllerScrol.position.maxScrollExtent);
  }
  @override
  Widget build(BuildContext context) {
    Size S = MediaQuery.of(context).size;

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
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: SociallCubit.get(context).messages.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 10,),
                          itemBuilder: (context, index) {
                            var t = SociallCubit.get(context).messages[index];
                            if (SociallCubit.get(context).UU!.uId ==
                                t.SenderID) {
                              return MyMessage(t);
                            }
                            return HisMessage(t);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "type your message here ..",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              controller: chatTextControoler,
                              keyboardType: TextInputType.text,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'the message must not be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: S.width * 0.01,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.teal,
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
                                chatTextControoler=TextEditingController();
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
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Text(
            t.text.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget HisMessage(ChatModel t) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Text(
            t.text.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
}
