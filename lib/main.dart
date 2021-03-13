import 'package:flutter/material.dart';
import 'package:toeic/blocs/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'MyApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}


