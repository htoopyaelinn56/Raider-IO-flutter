import 'package:flutter/material.dart';
import 'package:raider_io_flutter/SomeFunctions.dart';

class SavedCard extends StatelessWidget {
  final String name;
  final String cls;
  final double io;
  final GestureLongPressCallback deleteCallback;

  SavedCard({
    required this.name,
    required this.cls,
    required this.io,
    required this.deleteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: deleteCallback,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.indigo.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w800,
                    color: getClassColor(cls),
                  ),
                ),
                Text(
                  cls,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: getClassColor(cls),
                  ),
                ),
              ],
            ),
            Text(
              io == 0.0 ? '0' : io.toString(),
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: getIoColor(io),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
