import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  String desc =
      "One Piece adalah sebuah manga Jepang yang ditulis dan diilustrasikan oleh Eiichiro Oda. Manga ini telah dimuat berseri dalam majalah Weekly Shōnen Jump milik Shueisha sejak tanggal 22 Juli 1997, dan telah dibundel menjadi 99 volume tankōbon per Oktober 2021. Manga One Piece juga telah diterjemahkan ke dalam beberapa bahasa dan telah menjadi sukses di seluruh dunia. One Piece menceritakan petualangan Monkey D. Luffy, seorang bocah yang memiliki kekuatan elastis setelah tanpa sengaja memakan buah iblis. Bersama dengan krunya yang dinamai Bajak Laut Topi Jerami, Luffy menjelajahi Grand Line dalam mencari harta karun terbesar yang dikenal sebagai One Piece dan menjadi Raja Bajak Laut.";
  int likeCount = 0;

  void initState() {
    likeCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            likeCount++;
            print(likeCount);
          });
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.favorite),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              const Text("News Detail Screen")
            ],
          ),
          Image.network(
            "https://images2.alphacoders.com/105/1059649.jpg",
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Headline News",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(likeCount.toString())
                      ],
                    )
                  ],
                ),
                const Text(
                  "Source Image : wall.alphacoders.com",
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    fontFamily: AutofillHints.birthdayYear,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
