import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theproject/models/todo_model.dart';
import 'package:theproject/service/todo_service.dart';
import 'package:theproject/views/screens/cubit/cubit/cubit/dos_cubit.dart';

class page2 extends StatefulWidget {
  // const page2({super.key});

  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DosCubit(),
      child: BlocConsumer<DosCubit, DosState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is Dosloading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DosIerror) {
            return const Center(
              child: Text('error'),
            );
          }
          return ListView.builder(
              itemCount: context.watch<DosCubit>().todos.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                      context.watch<DosCubit>().todos[index].title ?? "--"),
                  //subtitle: Text((todos[index].userId ?? 0) as String),
                  trailing: const Icon(Icons.data_usage_rounded),
                  leading: Text("${index + 1}"),
                );
              });
        },
      ),
    );
  }
}
