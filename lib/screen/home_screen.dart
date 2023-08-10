import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:
              List.generate(10, (index) => UserStory(userName: "User $index"))),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(40)),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(userName: "User1", likeCount: 50, content: "배고프다 😟"),
  FeedData(userName: "User2", likeCount: 21, content: "같이 공부하러 갈 사람"),
  FeedData(userName: "User3", likeCount: 19, content: "휴가를 다녀왔다"),
  FeedData(userName: "User4", likeCount: 52, content: "오늘 축구했다!!"),
  FeedData(userName: "User5", likeCount: 79, content: "오늘 농구했다!"),
  FeedData(userName: "User6", likeCount: 83, content: "오늘 베드민턴했다!"),
];

class FeedList extends StatelessWidget {
  const FeedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: feedDataList.length,
        itemBuilder: (context, index) =>
            FeedItem(feedData: feedDataList[index]));
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,
                    ),
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark))
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "좋아요 ${feedData.likeCount}개",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: feedData.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),),
              TextSpan(text: feedData.content),
            ],
            style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
