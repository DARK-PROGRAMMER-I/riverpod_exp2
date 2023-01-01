import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

extension OperationalInfixAddition<T extends num> on T?{
  T? operator + (T? other){
    final shadow = this;
    if(shadow != null){
      return shadow +(other ?? 0) as T;
    }else{
      return null;
    }
  }
}
// This is the example below, that now if we have nullable value, but it wont effect.
// final int? a = 1;
// final int b = 1;
// final c = a + b;

class Counter extends StateNotifier<int?>{
  Counter(): super(null);
  increment(){
    return state != null ? state +1: 1;
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter Demo Home Page')
      ),
    );
  }
}


