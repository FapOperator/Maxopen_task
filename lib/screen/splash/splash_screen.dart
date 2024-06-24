// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:maxopen_task/application/loader/loader_cubit.dart';
// import 'package:maxopen_task/di/get_it.dart';
// import 'package:maxopen_task/route/route_constants.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<LoaderCubit>(
//       create: (_) => getIt<LoaderCubit>(),
//       child: BlocListener<LoaderCubit, LoaderState>(
//         listenWhen: (prev, current) => current != LoaderInitial(),
//         listener: (context, state) {
//           getNextScreen({required String routeList, dynamic params}) {
//             return Navigator.of(context)
//                 .pushReplacementNamed(routeList, arguments: params);
//           }

//           getNextScreen(routeList: RouteList.homeScreen);
//         },
//         child: const Scaffold(
//           body: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
