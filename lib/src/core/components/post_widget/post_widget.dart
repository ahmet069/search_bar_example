import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostWidget extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  const PostWidget({
    super.key,
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = id % 2 == 0 ? Color(0xffffffff) : Color(0xffe3e3e3);
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(description),
        ],
      ),
    );
  }
}
