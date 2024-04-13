import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/myobserver.dart';

import 'myapp.dart';

void main() {
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}

