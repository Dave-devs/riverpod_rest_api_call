import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import '../model/User.dart';
import 'detail.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(fetchUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api With Riverpod'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: userData.when(
          data: (data) {
            List<User> userList = data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(e: userList[index],)
                              )
                          );
                        },
                        child: Card(
                          color: Colors.blueAccent,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Text(
                                userList[index].id,
                                style: const TextStyle(color: Colors.white),
                            ),
                            title: Text(
                                userList[index].firstName,
                                style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                                userList[index].lastName,
                                style: const TextStyle(color: Colors.white),
                            ),
                            trailing: CircleAvatar(
                              backgroundImage: NetworkImage(userList[index].avatar),
                            ),
                          ),
                        ),
                      );
                    },
                ))
              ],
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text(error.toString()),);
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}