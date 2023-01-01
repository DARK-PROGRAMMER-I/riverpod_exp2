import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// extension OptionalInfixAddition<T extends num>on T?{
//   T? operator +(T? other){
//     final shadow = this;
//     if(shadow != null){
//       return shadow + (other ?? 0) as T;
//     }else{
//       return null;
//     }
//   }
// }

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


