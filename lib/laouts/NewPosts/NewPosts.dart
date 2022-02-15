import 'package:chat/laouts/Cubit/cubit.dart';
import 'package:chat/laouts/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPosts extends StatelessWidget {
  const NewPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SociallCubit()..getUsers(),
      child: BlocConsumer<SociallCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var UserModell = SociallCubit.get(context).UU;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Text('Create Post'),
              actions: [
                MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Post',
                    style:
                        const TextStyle(color: Colors.lightBlue, fontSize: 18),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: UserModell != null
                            ? NetworkImage(UserModell.ImageProfile.toString())
                            : const NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/chat-25714.appspot.com/o/users%2Fimage_picker7821665999907165931.jpg?alt=media&token=dbbcfd8e-d8b6-4e41-9258-757ff34d7794'),
                      ),
                      const Expanded(
                        child: Text(
                          '  أحمد الفريحان',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "what is on your mind ..."),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children:const [
                               Icon(
                                Icons.image,
                                color: Colors.blue,
                              ),
                               Text(
                                ' add photo',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(' # tags',
                              style: const TextStyle(color: Colors.blue)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
