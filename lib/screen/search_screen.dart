import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextBar(),
            SearchGrid(),
          ],
        ),
      ),
    );
  }
}

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "검색",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200,width: 1)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey,width: 1)
            ),
            contentPadding: EdgeInsets.all(0),
            filled: true,
            fillColor: Colors.grey.shade200,

          ),
        ),
      ),
    );
  }
}

final gridItems = List.generate(40, (index) => Colors.blue.shade300);

class SearchGrid extends StatelessWidget {
  const SearchGrid({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: gridItems.map((color) => Container(color: color)).toList(),
    );
  }
}
