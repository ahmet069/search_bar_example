import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/text_form_field/custom_text_form_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 70.h,
        title: CustomTextFromField(
          isReadOnly: false,
        ),
      ),
      body: Container(
        width: 1000.w,
        height: 1000.h,
        child: null,
        color: Color(0xffe3e3e3),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:search_bar_example/src/core/components/text_form_field/custom_text_form_field.dart';

// class SearchView extends StatefulWidget {
//   const SearchView({super.key});

//   @override
//   State<SearchView> createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomTextFromField(
//           isReadOnly: false,
//         ),
//         bottom: PreferredSize(
//           child: Container(),
//           preferredSize: Size(double.infinity, 30),
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           child: null,
//         ),
//       ),
//     );
//   }
// }

