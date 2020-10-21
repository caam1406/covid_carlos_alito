import 'package:covid_carlos_alito/core/models/covid.model.dart';
import 'package:covid_carlos_alito/core/provider/covid.provider.dart';
import 'package:covid_carlos_alito/core/service/covid.service.dart';
import 'package:covid_carlos_alito/view/covid/widgets/covid-button.dart';
import 'package:covid_carlos_alito/view/covid/widgets/totalizers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CovidHeader extends StatefulWidget {
  @override
  _CovidHeaderState createState() => _CovidHeaderState();
}

class _CovidHeaderState extends State<CovidHeader> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CovidService covidService = CovidService(context);

    return Consumer<CovidProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: CovidButton(
                      action: () {
                        covidService.setSortList(
                            SortCovid.byCases, !provider.orderAsc);
                      },
                      title: 'Por casos',
                      orderAsc: provider.orderAsc,
                      sortedBy: provider.sortedBy,
                      defaultValueSort: SortCovid.byCases,
                    ),
                  ),
                  Flexible(
                    child: CovidButton(
                      action: () {
                        print('gonzaga');
                      },
                      title: 'Por mortes',
                      orderAsc: provider.orderAsc,
                      sortedBy: provider.sortedBy,
                      defaultValueSort: SortCovid.byDeaths,
                    ),
                  ),
                  Flexible(
                    child: CovidButton(
                      action: () {
                        covidService.setSortList(
                            SortCovid.byState, !provider.orderAsc);
                      },
                      title: 'Por estado',
                      orderAsc: provider.orderAsc,
                      sortedBy: provider.sortedBy,
                      defaultValueSort: SortCovid.byState,
                    ),
                  ),
                  Flexible(
                    child: CovidButton(
                      action: () {
                        print('gonzaga');
                      },
                      title: 'Por região',
                      orderAsc: provider.orderAsc,
                      sortedBy: provider.sortedBy,
                      defaultValueSort: SortCovid.byRegion,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Material(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TotalizersScreen()));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Totalizadores'))),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    _filterCovidList(value, covidService);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _filterCovidList(String value, CovidService covidService) {
    covidService.filterCovidList(value);
  }
}
