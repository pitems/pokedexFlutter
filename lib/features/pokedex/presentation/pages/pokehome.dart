import 'package:basic_utils/basic_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex/core/constants/app_assets.dart';
import 'package:pokedex/core/constants/palette.dart';
import 'package:pokedex/features/pokedex/presentation/controller/pokehomecontroller.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/appbar_home.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/reload_data.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/rotating_pokeball.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/side_menu.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class PokeHome extends StatefulWidget {
  const PokeHome({Key? key}) : super(key: key);

  @override
  State<PokeHome> createState() => _PokeHomeState();
}

class _PokeHomeState extends State<PokeHome> {
  @override
  Widget build(BuildContext context) {
    return GetX<PokeHomeController>(
        init: PokeHomeController(),
        builder: (_) {
          return _.loading.value == true
              ? const Scaffold(
                  body: PokeBallLoading(),
                )
              : _.errorLoading.value == true
                  ? ReloadData(function: () {
                      _.loading.value = true;
                      _.errorLoading.value = false;
                      if (_.isFiltered == true) {
                        _.filterData(_.typeId);
                      } else {
                        _.getMainData();
                      }
                    })
                  : SideMenu(
                      key: _.sideMenuKey,
                      inverse: true,
                      onChange: (isOpened) {
                        _.sideMenuOpen.value = isOpened;
                      },
                      type: SideMenuType.slide,
                      background: Palette.background,
                      menu: MenuDesign(
                        controller: _,
                      ),
                      child: IgnorePointer(
                        ignoring: _.sideMenuOpen.value,
                        child: Scaffold(
                          appBar: appbarHome(_),
                          backgroundColor: Colors.grey[300],
                          body: Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Expanded(
                                  child: GridView.builder(
                                      itemCount: _.list.value.results.length,
                                      controller: _.scroll,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 5.0),
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              _.goToPokeDataCall(index);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: const AssetImage(
                                                          '${AppAssets.root}pokeball.png'),
                                                      colorFilter: ColorFilter.mode(
                                                          Colors.black.withOpacity(0.2),
                                                          BlendMode.dstATop)),
                                                  borderRadius: BorderRadius.circular(180)),
                                              // color: ,
                                              margin: const EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 10),
                                              child: Stack(children: [
                                                Positioned(
                                                  left: 20,
                                                  top: 3,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Hero(
                                                          tag: 'image-$index',
                                                          child: CachedNetworkImage(
                                                              height: 130,
                                                              fit: BoxFit.fill,
                                                              fadeInCurve: Curves.easeInOut,
                                                              placeholder: (context, url) {
                                                                return Image.asset(
                                                                  '${AppAssets.root}pokeball.png',
                                                                  scale: 6,
                                                                );
                                                              },
                                                              errorWidget: (context, url, error) {
                                                                return Image.asset(
                                                                  '${AppAssets.root}pokeball.png',
                                                                  scale: 6,
                                                                );
                                                              },
                                                              imageUrl:
                                                                  '${_.url}${_.getPokemonId(_.list.value.results[index].url)}.png')),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 80, left: 20),
                                                  child: Center(
                                                    child: SizedBox(
                                                      width: 140,
                                                      child: Text(
                                                        '#${_.getPokemonId(_.list.value.results[index].url)} ${StringUtils.capitalize(_.list.value.results[index].name)}',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ))),
                            ],
                          ),
                        ),
                      ));
        });
  }
}
