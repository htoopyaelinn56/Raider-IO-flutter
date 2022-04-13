import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raider_io_flutter/ProviderData/RioData.dart';
import 'package:raider_io_flutter/SavedScreenComponents/SavedCard.dart';
import 'package:raider_io_flutter/SomeFunctions.dart';
import '../Database/Player.dart';
import 'package:raider_io_flutter/Network/RioApi.dart';

class SavedData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        strokeWidth: 5.0,
      ),
      inAsyncCall: Provider.of<RioData>(context).updatingData,
      color: const Color(0xFF0A0E21),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Raider IO'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(Icons.sync),
                onPressed: () async {
                  Provider.of<RioData>(context, listen: false).onUpdating();
                  try {
                    for (var i in await GetIt.instance
                        .get<RioData>()
                        .getPlayerList()) {
                      var data = await RioApi(
                              name: i.name, region: i.region, realm: i.realm)
                          .getData();
                      await GetIt.instance.get<RioData>().updatePlayer(
                          data['mythic_plus_scores']['all'].toDouble(),
                          data['active_spec_name'],
                          i.name);
                    }
                  } on IOException catch (e) {
                    Provider.of<RioData>(context, listen: false).updateDone();
                    showToast('No internet connection!');
                  }
                  Provider.of<RioData>(context, listen: false).updateDone();
                },
              ),
            )
          ],
        ),
        body: StreamBuilder<List<Player>>(
            stream: GetIt.instance.get<RioData>().getPlayerStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    'Add your characters!',
                    style: TextStyle(fontSize: 24),
                  ),
                );
              }
              List<Player>? pData = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return SavedCard(
                    name: pData![index].name,
                    cls: '${pData[index].spec} ${pData[index].cls}',
                    io: pData[index].io,
                    deleteCallback: () {
                      Provider.of<RioData>(context, listen: false)
                          .deletePlayer(pData[index]);
                    },
                  );
                },
                itemCount: pData!.length,
              );
            }),
      ),
    );
  }
}
