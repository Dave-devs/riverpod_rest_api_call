import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_rest_api_call/logger/riverpod%20logger.dart';
import 'package:riverpod_rest_api_call/model/user_repo.dart';

import 'model/User.dart';
import 'pages/home.dart';

final fetchUserProvider = FutureProvider<List<User>>((ref) async {
 final users = ref.watch(userRepositoryProvider).fetchUserData();
 return users;
});

void main() {
  runApp(ProviderScope(
      observers: [ RiverpodLogger()],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Api With Riverpod',
      home: HomePage(),
    );
  }
}