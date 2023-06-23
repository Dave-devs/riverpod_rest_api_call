

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
    final data = ref.watch(fetchUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api With Riverpod'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: data.when(
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
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Text(userList[index].id),
                            title: Text(userList[index].firstName),
                            subtitle: Text(userList[index].lastName),
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