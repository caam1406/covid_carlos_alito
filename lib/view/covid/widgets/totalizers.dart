import 'package:covid_carlos_alito/core/constants/constants.dart';
import 'package:covid_carlos_alito/core/provider/covid.provider.dart';
import 'package:covid_carlos_alito/core/service/covid.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalizersScreen extends StatefulWidget {
  @override
  _TotalizersScreenState createState() => _TotalizersScreenState();
}

class _TotalizersScreenState extends State<TotalizersScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CovidProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Totalizadores'),
          ),
          body: ListView(
            shrinkWrap: true,
            children: _totalizers(provider, context),
          ),
        );
      },
    );
  }

  List<Widget> _totalizers(CovidProvider provider, BuildContext context) {
    final _regions = Constants.regions;

    return [
      Card(
        child: Column(
          children: [
            Text('Por região'),
            SizedBox(
              height: 20.0,
            ),
            ..._regions
                .map((region) => _regionTile(region, provider, context))
                .toList()
          ],
        ),
      ),
    ];
  }

  Widget _regionTile(
      String region, CovidProvider provider, BuildContext context) {
    final CovidService _covidService = CovidService(context);
    return Column(
      children: [
        Text(region),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                'Infectados: ${_covidService.getTotalCasesByRegion(region)}'),
            Text(
                'Mortos: ${_covidService.getTotalDeathsByRegion(region)}')
          ],
        )
      ],
    );
  }
}
