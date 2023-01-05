import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
      const ProviderScope(
          child:  MyApp(),
      )
  );
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
  void increment()=> state == null? 1 : state +1;
}

// Lets create a provider for watching the changes
final counterProvider = StateNotifierProvider<Counter, int?>((ref) => Counter());

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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child){
            final value = ref.watch(counterProvider);
            final text = value ?? "Press Me";
            print(text.toString());
            return AppBar(
                title: Text(text.toString(), style: TextStyle(fontSize: 12),)
            );
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey)
          ),
          onPressed: ref.read(counterProvider.notifier).increment,
           child: Text("Press me!"),
        ),
      ),
    );
  }
}


