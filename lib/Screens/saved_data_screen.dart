import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raider_io_flutter/ProviderData/RioData.dart';
import 'package:raider_io_flutter/SavedScreenComponents/SavedCard.dart';

class SavedData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RioData>(
      builder: (context, item, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return SavedCard(
              name: item.charList[index].name,
              cls: '${item.charList[index].spec} ${item.charList[index].cls}',
              io: item.charList[index].io,
            );
          },
          itemCount: item.charList.length,
        );
      },
    );
  }
}
