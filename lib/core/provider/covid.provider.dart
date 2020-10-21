import 'package:covid_carlos_alito/core/models/covid.model.dart';
import 'package:covid_carlos_alito/core/utils/strings/strings-utils.dart';
import 'package:flutter/material.dart';

class CovidProvider extends ChangeNotifier {
  List<CovidModel> _covidList = [];
  List<CovidModel> _originalCovidList = [];
  SortCovid sortedBy = SortCovid.byState;
  bool orderAsc = true;

  List<CovidModel> get covidList => _covidList;
  List<CovidModel> get originalCovidList => _originalCovidList;

  void setCovidList(List<CovidModel> list) {
    _covidList = list;
    _originalCovidList = list;
    notifyListeners();
  }

  void setSortList(SortCovid sortValue, bool orderValue) {
    sortedBy = sortValue;
    orderAsc = orderValue;

    notifyListeners();

    print(sortedBy);
    print(orderAsc);
  }

  void filterCovidList(String value) {
    if (value == null || value.isEmpty) {
      _covidList = _originalCovidList;
    } else {
      _covidList = _originalCovidList
          .where((element) =>
              StringsUtils.removeDiactrics(element.state.toLowerCase())
                      .indexOf(value.toLowerCase()) >
                  -1 ||
              StringsUtils.removeDiactrics(element.region.toLowerCase())
                      .indexOf(value.toLowerCase()) >
                  -1)
          .toList();

      notifyListeners();
    }
  }
}
