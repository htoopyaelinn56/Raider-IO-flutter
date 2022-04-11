import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raider_io_flutter/ProviderData/RioData.dart';
import '../SearchScreenComponents/RadioButtonsRegions.dart';
import '../SearchScreenComponents/RioTextField.dart';
import 'package:raider_io_flutter/Network/RioApi.dart';
import 'package:raider_io_flutter/SearchScreenComponents/ResultDialog.dart';
import 'package:raider_io_flutter/SearchScreenComponents/ErrorDialog.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController realmController = TextEditingController();

  void searchAction(BuildContext context) async {
    var providerItem = Provider.of<RioData>(context, listen: false);
    providerItem.checkName(nameController.text);
    providerItem.checkRealm(realmController.text);

    bool nameError = providerItem.nameError;
    bool realmError = providerItem.realmError;
    String currentRegion = providerItem.currentRegion;
    if (nameError == false && realmError == false) {
      providerItem.searching();
      dynamic result = await RioApi(
              name: nameController.text,
              realm: realmController.text,
              region: currentRegion)
          .getData();
      providerItem.searchDone();
      if (result == 404) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ErrorDialogRio();
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ResultDialogRio(result: result);
          },
        );
      }
      nameController.text = '';
      realmController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raider IO'),
      ),
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          strokeWidth: 5.0,
        ),
        color: const Color(0xFF0A0E21),
        inAsyncCall: Provider.of<RioData>(context).searchingRio,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RioTextField(
                controller: nameController,
                errorText: 'Name is empty!',
                hintText: 'Enter character name.',
                error: Provider.of<RioData>(context).nameError,
              ),
              const SizedBox(
                height: 10,
              ),
              RioTextField(
                controller: realmController,
                errorText: 'Realm is empty',
                hintText: 'Enter realm name.',
                error: Provider.of<RioData>(context).realmError,
              ),
              const SizedBox(
                height: 10,
              ),
              RegionRadioButtons(),
              SizedBox(
                width: 110.0,
                child: ElevatedButton(
                  onPressed: () {
                    searchAction(context);
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.indigo.shade900),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
