import 'package:flutter/material.dart';
import 'package:raider_io_flutter/SomeFunctions.dart';
import 'package:provider/provider.dart';
import 'package:raider_io_flutter/DataModel/character.dart';
import '../ProviderData/RioData.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResultDialogRio extends StatelessWidget {
  final dynamic result;

  ResultDialogRio({required this.result});

  Widget resultRow([
    String field = '',
    String property = '',
    Color ioColor = Colors.white,
  ]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            field,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            property,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: ioColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF0A0E21),
      title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${result['name']}',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0,
                      color: getClassColor(result['class']),
                    ),
              ),
              Text(
                "${result['active_spec_name']} ${result['class']}",
                style: TextStyle(
                  fontSize: 16.0,
                  color: getClassColor(result['class']),
                ),
              )
            ],
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          resultRow(
              'IO',
              '${result['mythic_plus_scores']['all']}',
              getIoColor(double.parse(
                  result['mythic_plus_scores']['all'].toString()))),
          resultRow('Faction', '${result['faction']}',
              getFactinColor(result['faction'].toString())),
          resultRow('ilvl', '${result['gear']['item_level_equipped']}'),
          resultRow('SOFO Prog',
              '${result['raid_progression']['sepulcher-of-the-first-ones']['summary']}'),
          resultRow('Achievements', '${result['achievement_points']}'),
          resultRow('Last online',
              result['last_crawled_at'].toString().substring(0, 10)),
        ], //raid_progression['sepulcher-of-the-first-ones']
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF0A0E21)),
          ),
          child: const Icon(Icons.save),
          onPressed: () {
            for (var i
                in Provider.of<RioData>(context, listen: false).charList) {
              print(i.name);
            }
            Character c = Character(
              name: result['name'],
              cls: result['class'],
              spec: result['active_spec_name'],
              io: result['mythic_plus_scores']['all'].toDouble(),
            );
            bool isContain = Provider.of<RioData>(context, listen: false)
                .checkCharacterInList(c);
            if (isContain == false) {
              Provider.of<RioData>(context, listen: false).addToCharList(c);
            }
            Navigator.of(context).pop();
            showToast(isContain
                ? 'Character already exists!'
                : 'Added Successfully!');
          },
        ),
        Container(
          padding: const EdgeInsets.only(right: 25),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF0A0E21)),
            ),
            child: const Icon(Icons.check),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
