import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/core/utils/reusable_componenets/custom_form_field.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/searchveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetSearch/saerchlist.dart';

class TabSearch extends StatefulWidget {
  TabSearch({Key? key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  TextEditingController textMovie = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      // Close the keyboard
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchViewModel>(),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      focusNode: _focusNode,
                onChanged: (val){
                  setState(() {
                    textMovie.text=val;
                    print(textMovie.text);
                  });
                  if (textMovie.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                  }
                },
                      controller: textMovie,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder
                            (borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide(width: 30.0,style:BorderStyle.solid )),
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.saved_search_rounded,size: 30.0,color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white,fontSize: 25.0)

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Handle tap outside TextFormField
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: SizedBox(height: 1.0.h,)),
                    textMovie.text.isEmpty?
                    SliverToBoxAdapter(child: Column(
                      children: [
                        Image(image: AssetImage("assets/images/Icon material-local-movies.png")),
                        Text("No movies found",style: TextStyle(color: Colors.white,fontSize: 35.0.sp),)
                      ],
                    ))
                        :BlocProvider(create: (BuildContext context)=>getIt<SearchViewModel>(),
                        child: SearchLitWidget(text:textMovie.text,)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }
}
