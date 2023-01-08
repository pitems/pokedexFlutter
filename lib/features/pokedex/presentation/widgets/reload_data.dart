import 'package:flutter/material.dart';

class ReloadData extends StatefulWidget {
  const ReloadData({required this.function, Key? key}) : super(key: key);
  final VoidCallback function;
  @override
  State<ReloadData> createState() => _ReloadDataState();
}

class _ReloadDataState extends State<ReloadData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: widget.function,
            child: Center(
              child: Image.asset(
                'assets/pokeball.png',
                width: 100,
              ),
            ),
          ),
          const Text('We had a problem'),
          const Text('Press on the PokeBall to try again')
        ],
      ),
    );
  }
}
