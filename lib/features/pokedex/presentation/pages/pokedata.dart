import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:pokedex/core/services/service_locator.dart';
import 'package:pokedex/features/pokedex/presentation/controller/pokedatacontroller.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/appbar_detail.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/reload_data.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/rotating_pokeball.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/tab_details.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/tab_moves.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/tab_sprites.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets/tab_stats.dart';

class PokeDataPage extends StatefulWidget {
  const PokeDataPage({Key? key}) : super(key: key);

  @override
  State<PokeDataPage> createState() => _PokeDataPageState();
}

class _PokeDataPageState extends State<PokeDataPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final PokeDataController _pokeDataController = sl<PokeDataController>();
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    _pokeDataController.initAsync();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pokeDataController.loading.value = true;
    _pokeDataController.totalStat.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<PokeDataController>(
      init: _pokeDataController,
      builder: ((_) {
        return _.loading.value == true
            ? const Scaffold(body: PokeBallLoading())
            : _.errorLoading.value == true
                ? ReloadData(function: () {
                    _.loading.value = true;
                    _.errorLoading.value = false;
                    _.callPokeData();
                  })
                : Scaffold(
                    appBar: appbarDetail(_.mainColor, _.pokeData.id.toString()),
                    // backgroundColor: _.mainColor,
                    body: Stack(children: [
                      Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [_.mainColor, Colors.white]),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 22.h),
                        child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            height: 80.h,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(25))),
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        StringUtils.capitalize(_.pokeData.name),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (var item in _.pokeData.types)
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Image.asset('assets/types/${item.type.name}.png'),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(StringUtils.capitalize(item.type.name),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20))
                                              ],
                                            )
                                            // Chip(label: Text(item.type.name)),
                                            )
                                    ],
                                  ),
                                  TabBar(
                                      controller: tabController,
                                      onTap: ((value) {
                                        if (value == 3) {
                                          _.visibility.value = false;
                                        } else {
                                          _.visibility.value = true;
                                        }
                                      }),
                                      labelStyle: const TextStyle(
                                          //up to your taste
                                          fontWeight: FontWeight.w700),
                                      indicatorSize: TabBarIndicatorSize.label, //makes it better
                                      labelColor: const Color(0xff1a73e8), //Google's sweet blue
                                      unselectedLabelColor: const Color(0xff5f6368), //niceish grey
                                      isScrollable: true, //up to your taste

                                      tabs: const <Widget>[
                                        Tab(
                                          text: 'Stats',
                                        ),
                                        Tab(
                                          text: 'Details',
                                        ),
                                        Tab(
                                          text: 'Moves',
                                        ),
                                        Tab(
                                          text: 'Sprites',
                                        )
                                      ]),
                                  Expanded(
                                    child: TabBarView(controller: tabController, children: [
                                      Container(child: stats(_.pokeData, _.totalStat.value)),
                                      details(_.pokeData, _.pokeSpecies),
                                      pokemoves(_.pokeData, _),
                                      spriteTab(_.pokeData)
                                    ]),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Positioned(
                        top: 8.h,
                        left: 100,
                        child: Container(
                          height: 250,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.red,
                                child: AnimatedOpacity(
                                  opacity: _.visibility.value == true ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 500),
                                  child: FadeInImage.memoryNetwork(
                                    width: 200,
                                    placeholder: kTransparentImage,
                                    image: _.pokeData.sprites.frontDefault!,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //     top: 40,
                      //     left: 75.w,
                      //     child: Row(
                      //       children: [
                      //         Image.asset(
                      //           'assets/pokeball.png',
                      //           scale: 8,
                      //         ),
                      //         const SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text('# ${_.pokeData.id.toString()}',
                      //             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                      //       ],
                      //     ))
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     const SizedBox(
                      //       height: 30,
                      //     ),
                      //     Container(
                      //       height: 250,
                      //       decoration: const BoxDecoration(
                      //           color: Colors.purple,
                      //           borderRadius: BorderRadius.only(
                      //               bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Container(
                      //             // color: Colors.red,
                      //             child: FadeInImage.memoryNetwork(
                      //               width: 200,
                      //               placeholder: kTransparentImage,
                      //               image: _.pokeData.sprites.frontDefault!,
                      //               fit: BoxFit.fitHeight,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     Row(
                      //       children: [
                      //         Expanded(
                      //           child: Text(
                      //             StringUtils.capitalize(_.pokeData.name),
                      //             style: const TextStyle(fontSize: 25, color: Colors.white),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //         Text(_.pokeData.id.toString())
                      //       ],
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         for (var item in _.pokeData.types)
                      //           Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Column(
                      //                 children: [
                      //                   Image.asset('assets/types/${item.type.name}.png'),
                      //                   const SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text(StringUtils.capitalize(item.type.name),
                      //                       style: const TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 20))
                      //                 ],
                      //               )
                      //               // Chip(label: Text(item.type.name)),
                      //               )
                      //       ],
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Card(
                      //           color: Colors.grey,
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                 '${(_.pokeData.weight / 10)} Kg.',
                      //                 style: const TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 30,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               const Text('Weight')
                      //             ],
                      //           ),
                      //         ),
                      //         Card(
                      //           color: Colors.grey,
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                 '${(_.pokeData.height / 10)} Mts.',
                      //                 style: const TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 30,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               const Text('Weight')
                      //             ],
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //     TabBar(
                      //         controller: tabController,
                      //         labelStyle: const TextStyle(
                      //             //up to your taste
                      //             fontWeight: FontWeight.w700),
                      //         indicatorSize: TabBarIndicatorSize.label, //makes it better
                      //         labelColor: const Color(0xff1a73e8), //Google's sweet blue
                      //         unselectedLabelColor: const Color(0xff5f6368), //niceish grey
                      //         isScrollable: true, //up to your taste

                      //         tabs: const <Widget>[
                      //           Tab(
                      //             text: 'Stats',
                      //           ),
                      //           Tab(
                      //             text: 'Details',
                      //           ),
                      //           Tab(
                      //             text: 'Moves',
                      //           )
                      //         ]),
                      //     Expanded(
                      //       child: TabBarView(controller: tabController, children: [
                      //         Container(color: Colors.black, child: stats(_.pokeData)),
                      //         details(_.pokeData, _.pokeSpecies),
                      //         const Text('fuck')
                      //       ]),
                      //     )
                      //   ],
                      // ),
                    ]),
                  );
      }),
    );
  }
}
