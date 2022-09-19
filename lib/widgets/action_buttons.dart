import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserLoadEvent());
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: Text('Load'),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserClearEvent());
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: Text('Clear'),
        ),
      ],
    );
  }
}
