import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/cubit/internet_cubit.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:bloc_network_example/widgets/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserBloc(userRepository: context.read<UserRepository>())
                  ..add(UserLoadEvent()),
          ),
          BlocProvider(create: (context) => ConnectionCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<ConnectionCubit, MyConnectionSatate>(
              builder: (context, state) => state.connected
                  ? const Text('User List (в сети)')
                  : const Text(
                      'Нет соединение с интернет!',
                      style: TextStyle(color: Colors.red),
                    ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
