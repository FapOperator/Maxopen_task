import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/application/loading/loading_cubit.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, shouldShow) {
        return Material(
          child: Stack(
            fit: StackFit.expand,
            children: [
              screen,
              if (shouldShow)
                Container(
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // Image.asset(
                        //   'assets/images/loading_logo.png',
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Загрузка',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
