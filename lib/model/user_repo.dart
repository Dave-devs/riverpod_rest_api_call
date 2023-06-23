import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'User.dart';

class UserRepository {
  final Ref ref;
  UserRepository(this.ref);
  
  String endpoint = 'https://random-data-api.com/api/v2/users';
  
  Future<List<User>> fetchUserData() async {
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});