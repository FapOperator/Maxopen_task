import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/features/bookmarks/screen/bookmarks_screen.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/bottom_bar/bottom_bar_bloc.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/home/home_screen.dart';
import 'package:maxopen_task/features/search/presentation/screen/search_screen.dart';
import 'package:maxopen_task/core/theme/app_color.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainView> {
  static List<Widget> bottomNavScreen = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const BookmarksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarBloc, BottomBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColor.background,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  state.tabIndex == 0
                      ? 'assets/images/icons/home.png'
                      : 'assets/images/icons/home_outline.png',
                  width: 18,
                  height: 20,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  state.tabIndex == 1
                      ? 'assets/images/icons/search.png'
                      : 'assets/images/icons/search_outline.png',
                  width: 20,
                  height: 20,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  state.tabIndex == 2
                      ? 'assets/images/icons/favourite.png'
                      : 'assets/images/icons/favourite_outline.png',
                  width: 17,
                  height: 24,
                ),
                label: 'Favourite',
              ),
            ],
            currentIndex: state.tabIndex,
            selectedItemColor: AppColor.assent,
            unselectedItemColor: AppColor.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              BlocProvider.of<BottomBarBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
