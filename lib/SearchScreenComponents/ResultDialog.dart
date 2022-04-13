import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:raider_io_flutter/Database/Player.dart';
import 'package:raider_io_flutter/SomeFunctions.dart';
import 'package:provider/provider.dart';
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
      content: SingleChildScrollView(
        child: Column(
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
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF0A0E21)),
          ),
          child: const Icon(Icons.save),
          onPressed: () async {
            Player p = Player(
              name: result['name'],
              cls: result['class'],
              spec: result['active_spec_name'],
              io: result['mythic_plus_scores']['all'].toDouble(),
              region: result['region'],
              realm: result['realm'],
            );
            bool isContain = await Provider.of<RioData>(context, listen: false)
                .checkCharacterInData(p);
            bool needToUpdate = false;
            if (!isContain) {
              await Provider.of<RioData>(context, listen: false)
                  .addToCharList(p);
            } else if (isContain) {
              for (var i
                  in await GetIt.instance.get<RioData>().getPlayerList()) {
                if (i.name == p.name && i.io != p.io) {
                  GetIt.instance
                      .get<RioData>()
                      .updatePlayer(p.io, p.spec, p.name);
                  needToUpdate = true;
                } else if (i.name == p.name && i.io == p.io) {
                  needToUpdate = false;
                }
              }
            }
            showToast(isContain
                ? needToUpdate
                    ? 'Updated!'
                    : 'Character already exists!'
                : 'Added Successfully!');
            Navigator.of(context).pop();
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
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
