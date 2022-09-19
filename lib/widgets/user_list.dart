import 'dart:developer';

import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('User is loaded')));
        }
      }),
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text('No data reveived. Please button "Load"',
                style: TextStyle(fontSize: 20)),
          );
        }
        if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUsers.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Text(
                  'ID ${state.loadedUsers[index].id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text(
                      '${state.loadedUsers[index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'Email: ${state.loadedUsers[index].email}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone: ${state.loadedUsers[index].phone}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
