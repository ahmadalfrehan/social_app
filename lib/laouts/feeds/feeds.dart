import 'package:chat/laouts/Cubit/cubit.dart';
import 'package:chat/laouts/Cubit/states.dart';
import 'package:chat/modulo/PostModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SociallCubit()
        ..getUsers()
        ..getPosts(),
      child: BlocConsumer<SociallCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (SociallCubit.get(context).UU == null) {
            return const Center(child: CircularProgressIndicator());
          }
          var UserModell = SociallCubit.get(context).UU;
          var indexISL = SociallCubit.get(context).isLiked.length;
          return SingleChildScrollView(
            child: Column(
              children: [
                if (state is SocialGetPostsLoadingStates)
                  const LinearProgressIndicator(),
                if (SociallCubit.get(context).PP.isEmpty &&
                    state is! SocialGetPostsLoadingStates)
                  const Center(
                    child: Text('No Posts Yet'),
                  ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Post(
                      SociallCubit.get(context).PP[index],
                      context,
                      index,
                      indexISL),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: SociallCubit.get(context).PP.length,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget Post(PostModel P, context, index, indexISL) {
    Size S = MediaQuery.of(context).size;
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
                  backgroundImage: NetworkImage(
                      SociallCubit.get(context).UU!.ImageProfile.toString()),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      P.name.toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      P.dateTime.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                P.text.toString(),
              ),
            ),
            P.PostImage != ""
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(P.PostImage.toString()),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                    ),
                  )
                : const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SociallCubit.get(context).LikeLength.isNotEmpty
                            ? Text(
                                SociallCubit.get(context)
                                    .LikeLength[index]
                                    .toString(),
                              )
                            : const Text('0'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      SociallCubit.get(context).getLikes();
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.messenger_outline,
                          color: Colors.cyan,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('0'),
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
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(P.Image.toString())),
                      const SizedBox(
                        width: 5,
                      ),
                      const Expanded(
                        child: Text(
                          'Write your comment..',
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      SociallCubit.get(context)
                          .LikePost(SociallCubit.get(context).Likes[index]);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: S.width * 0.01,
                        ),
                        const Expanded(
                          child: Text(
                            'Love',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      SociallCubit.get(context)
                          .disLike(SociallCubit.get(context).Likes[index]);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: S.width * 0.01,
                        ),
                        const Expanded(
                          child: Text(
                            'Dislove',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
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
