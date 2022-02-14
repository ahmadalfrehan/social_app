import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Post(),
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 8,
            ),
            itemCount: 5,
          )
        ],
      ),
    );
  }

  Widget Post() {
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
              children: const [
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3mGL7MA05qMPhCSSbB7C2bfI6I6Hyzuv_mZkh6lxhJ54qfhBAA-y7tBIlVq7nldYRlas&usqp=CAU'),
                ),
                Text(
                  '  أحمد الفريحان',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' . ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 60,
                ),
                Text(
                  '10 November',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              //    textDirection: TextDirection.ltr,
            ),
            Container(
              padding: EdgeInsets.zero,
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwGPF8X5lgcLBtUZUXV9kPPpfw7IuIsTq3uQ&usqp=CAU'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.favorite,color: Colors.red,),
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
                        Icon(Icons.messenger_outline,color: Colors.cyan,),
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
            Divider(),
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
                                Expanded(child: Text('Love',style: TextStyle(fontSize: 13),)),
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
                                Expanded(child: Text('share',style: TextStyle(fontSize: 13),)),
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
