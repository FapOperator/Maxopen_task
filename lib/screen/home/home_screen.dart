import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text('Главное меню'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                // SessionDataProvider().deleteUserInfo();
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: constraints.maxHeight,
              decoration: const BoxDecoration(
                //Here goes the same radius, u can put into a var or function
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // FutureBuilder(
                        //     future: getIt<SessionDataProvider>().getUserInfo(),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.hasData) {
                        //         return Text(
                        //             'Здравствуй, ${snapshot.data!.fullname}');
                        //       }
                        //       return Container();
                        //     }),
                        Expanded(
                          child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1),
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                onTap: () {
                                  // getIt.resetLazySingleton<AddRequestCubit>();
                                  // getIt.resetLazySingleton<PickerPhotoBloc>();
                                  // Navigator.of(context)
                                  //     .pushNamed(RouteList.summaryScreen);
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25))),
                                  color: Colors.grey[300],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.create,
                                        size: 50,
                                      ),
                                      Text(
                                        'Новая заявка',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).pushNamed(
                                  //     RouteList.requestListScreen,
                                  //     arguments: false);
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25))),
                                  color: Colors.grey[300],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.list_alt_outlined,
                                        size: 50,
                                      ),
                                      Text(
                                        'Просмотр заявок',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
