import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/app_assets.dart';
import 'package:pokedex/core/constants/pokemon_types.dart';
import 'package:pokedex/features/pokedex/presentation/controller/pokehomecontroller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuDesign extends StatefulWidget {
  const MenuDesign({required this.controller, Key? key}) : super(key: key);
  final PokeHomeController controller;
  @override
  State<MenuDesign> createState() => _MenuDesignState();
}

class _MenuDesignState extends State<MenuDesign> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Filter:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text('Nothing')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    widget.controller.toggleMenu();
                    widget.controller.resetData();
                  },
                  child: Card(
                    color: Colors.white,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            '${AppAssets.root}pokeball.png',
                            scale: 8,
                          ),
                          const Text(
                            'Reset',
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: PokeTypes.listTypes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 5),
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          widget.controller.toggleMenu();
                          widget.controller
                              .filterData(PokeTypes.getTypeID(PokeTypes.listTypes[index]));
                        },
                        child: Card(
                          color: PokeTypes.listColors[index],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('${AppAssets.types}${PokeTypes.listTypes[index]}.png'),
                              Text(
                                StringUtils.capitalize(
                                  PokeTypes.listTypes[index],
                                ),
                                style: const TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
