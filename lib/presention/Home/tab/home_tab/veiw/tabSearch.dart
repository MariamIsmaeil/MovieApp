import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/core/utils/reusable_componenets/custom_form_field.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart';

class TabSearch extends StatefulWidget {
  TabSearch({Key? key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  TextEditingController textMovie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomFormField(controller: textMovie, label: 'ss', keyboard:TextInputType.text, onChanged: (va){})
    ],);
  }

}
