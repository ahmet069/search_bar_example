import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostWidget extends StatelessWidget {
  final int id;
  final String userName;
  final String name;
  const PostWidget({
    super.key,
    required this.id,
    required this.name,
    required this.userName,
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
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(userName),
        ],
      ),
    );
  }
}
