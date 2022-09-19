import 'package:bloc_network_example/models/user.dart';

abstract class UserEvent {}

class UserLoadEvent extends UserEvent {}
class UserClearEvent extends UserEvent {}
