import 'package:chat/laouts/Cubit/cubit.dart';
import 'package:chat/laouts/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SociallCubit()..getUsers(),
      child: BlocConsumer<SociallCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var UserModell = SociallCubit.get(context).UU;
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Post(UserModell),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: 5,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget Post(var UserModell) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
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
                  backgroundImage: UserModell != null
                      ? NetworkImage(UserModell.ImageProfile.toString())
                      : const NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/chat-25714.appspot.com/o/users%2Fimage_picker7821665999907165931.jpg?alt=media&token=dbbcfd8e-d8b6-4e41-9258-757ff34d7794'),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'أحمد الفريحان',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '10 November',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              //    textDirection: TextDirection.ltr,
            ),
            Container(
              padding: EdgeInsets.zero,
              child: UserModell != null
                  ? Image.network(UserModell.ImageProfile.toString())
                  : Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/chat-25714.appspot.com/o/users%2Fimage_picker7821665999907165931.jpg?alt=media&token=dbbcfd8e-d8b6-4e41-9258-757ff34d7794'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('555'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.messenger_outline,
                          color: Colors.cyan,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('114'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3mGL7MA05qMPhCSSbB7C2bfI6I6Hyzuv_mZkh6lxhJ54qfhBAA-y7tBIlVq7nldYRlas&usqp=CAU',
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'Write your comment..',
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Expanded(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Expanded(
                                    child: Text(
                                  'Love',
                                  style: TextStyle(fontSize: 13),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Expanded(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.ios_share,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Expanded(
                                    child: Text(
                                  'share',
                                  style: TextStyle(fontSize: 13),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
