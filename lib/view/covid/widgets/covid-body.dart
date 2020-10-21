import 'package:covid_carlos_alito/core/models/covid.model.dart';
import 'package:covid_carlos_alito/core/provider/covid.provider.dart';
import 'package:covid_carlos_alito/view/covid/widgets/covid-tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CovidBody extends StatefulWidget {
  @override
  _CovidBodyState createState() => _CovidBodyState();
}

class _CovidBodyState extends State<CovidBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CovidProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            shrinkWrap: true,
            children: _covidList(provider),
          ),
        );
      },
    );
  }

  List<Widget> _covidList(CovidProvider provider) {
    _resolveSort(provider);
    return provider.covidList.map((entry) => CovidTile(item: entry)).toList();
  }

  void _resolveSort(CovidProvider provider) {
    if (provider.sortedBy == SortCovid.byState) {
      if (provider.orderAsc)
        provider.covidList.sort((a, b) => a.state.compareTo(b.state));
      else
        provider.covidList.sort((a, b) => b.state.compareTo(a.state));
    } else if (provider.sortedBy == SortCovid.byCases) {
      if (provider.orderAsc)
        provider.covidList.sort((a, b) => a.cases.compareTo(b.cases));
      else
        provider.covidList.sort((a, b) => b.cases.compareTo(a.cases));
    }
  }
}
