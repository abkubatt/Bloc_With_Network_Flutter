import 'package:bloc_network_example/services/user_api_provider.dart';

import '../models/user.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}