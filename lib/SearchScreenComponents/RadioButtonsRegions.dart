import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ProviderData/RioData.dart';

class RegionRadioButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                  activeColor: Colors.indigo.shade500,
                  value: 'US',
                  groupValue: Provider.of<RioData>(context).currentRegion,
                  onChanged: (index) {
                    Provider.of<RioData>(context, listen: false)
                        .changeRegion(index.toString());
                  }),
              const Expanded(
                child: Text('US'),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                  activeColor: Colors.indigo.shade500,
                  value: 'EU',
                  groupValue: Provider.of<RioData>(context).currentRegion,
                  onChanged: (index) {
                    Provider.of<RioData>(context, listen: false)
                        .changeRegion(index.toString());
                  }),
              const Expanded(
                child: Text('EU'),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                  activeColor: Colors.indigo.shade500,
                  value: 'KR',
                  groupValue: Provider.of<RioData>(context).currentRegion,
                  onChanged: (index) {
                    Provider.of<RioData>(context, listen: false)
                        .changeRegion(index.toString());
                  }),
              const Expanded(
                child: Text('KR'),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                  activeColor: Colors.indigo.shade500,
                  value: 'TW',
                  groupValue: Provider.of<RioData>(context).currentRegion,
                  onChanged: (index) {
                    Provider.of<RioData>(context, listen: false)
                        .changeRegion(index.toString());
                  }),
              const Expanded(
                child: Text('TW'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
