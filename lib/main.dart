import 'dart:math';
import 'package:flutter/material.dart';
import 'package:youtube_like_on_flutter/video_detail_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Your Youtube Channel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(100, (i) => '$i');
  final _textStyle = const TextStyle(fontWeight: FontWeight.w500);

  void _listTapped() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoDetailView()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.video_call_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.blueGrey[100],
        centerTitle: false,
        title: Text(
            widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.network("https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    const Text("私の個人チャンネル"),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.video_call_sharp, color: Colors.red,),
                          Text("登録する", style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: _listTapped,
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.network("https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
                    ),
                    title: Text(
                        '[Flutter入門]　Lesson ${index + 1}　リスト生成する方法',
                      style: _textStyle,
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                        '${index * Random().nextInt(1000)}回再生',
                          style: _textStyle
                    ),
                        const SizedBox(width: 10.0),
                        Text(
                            '${Random().nextInt(365)}日前',
                          style: _textStyle,
                        )
                      ],
                    ),
                    trailing: PopupMenuButton<int>(
                      initialValue: 1,
                      child: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 1) {
                          showDialog<void>(
                              context: context,
                              builder: (_) {
                                return const AlertDialog(
                                  title: Text('ありがとう'),
                                  content: Text('有り難う'),
                                );
                              }
                          );
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                            value: 1,
                            child: Text('お気に入り追加')
                        ),
                        PopupMenuItem(
                            value: 2,
                            child: Text('後でみる')
                        ),
                        PopupMenuItem(
                            value: 3,
                            child: Text('興味ない')
                        ),
                      ]
                    ),
                  );
                },
              )
          )
        ],
      )
    );
  }
}
