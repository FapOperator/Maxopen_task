import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/bottom_bar/bottom_bar_bloc.dart';
import 'package:maxopen_task/core/theme/app_color.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final bool isGoBack;
  const CustomTitle({super.key, required this.title, this.isGoBack = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isGoBack
            ? BlocBuilder<BottomBarBloc, BottomBarState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<BottomBarBloc>(context)
                          .add(TabChange(tabIndex: 0));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColor.white,
                      size: 25,
                      weight: 100,
                    ),
                  );
                },
              )
            : Container(),
        Container(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
                text: title,
                style: Theme.of(context).textTheme.titleLarge,
                children: <TextSpan>[
                  TextSpan(
                    text: '.',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColor.assent),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
