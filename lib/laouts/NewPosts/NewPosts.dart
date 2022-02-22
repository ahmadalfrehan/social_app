import 'package:chat/laouts/Cubit/cubit.dart';
import 'package:chat/laouts/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class NewPosts extends StatelessWidget {
  const NewPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SociallCubit()..getUsers(),
      child: BlocConsumer<SociallCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var UserModell = SociallCubit.get(context).UU;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).bottomAppBarColor,
              elevation: 0,
              title: const Text('Create Post'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    var now = DateTime.now();
                    if (SociallCubit.get(context).PostImagee != null) {
                      SociallCubit.get(context).uploadImagePost(
                          text: postController.text, dateTime: now.toString());
                    } else {
                      SociallCubit.get(context).CreatePost(
                          text: postController.text, dateTime: now.toString());
                    }
                  },
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                  ),
                )
              ],
            ),

            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if(state is SocialPostLoadingStates)
                    LinearProgressIndicator(),
                  if(state is SocialPostLoadingStates)
                  const SizedBox(
                    height: 8
                  ),

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
                      controller: postController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "what is on your mind ..."),
                    ),
                  ),
                  SizedBox(height: 20,),
                  if(SociallCubit.get(context).PostImagee!=null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(SociallCubit.get(context).PostImagee),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          SociallCubit.get(context).CloseImage();
                        },
                        child: const CircleAvatar(
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            SociallCubit.get(context)
                                .getImagePost(ImageSource.gallery);
                          },
                          child: Row(
                            children: const [
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
