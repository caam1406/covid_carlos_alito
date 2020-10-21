import 'dart:convert';

import 'package:covid_carlos_alito/core/constants/endpoints/endpoints.const.dart';
import 'package:covid_carlos_alito/core/models/covid.model.dart';
import 'package:covid_carlos_alito/core/provider/covid.provider.dart';
import 'package:covid_carlos_alito/core/service/common-http.service.dart';
import 'package:covid_carlos_alito/core/utils/strings/strings-utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CovidService {
  BuildContext context;
  CovidProvider covidProvider;
  final CommonHttp http = CommonHttp();

  CovidService(BuildContext ctx) {
    context = ctx;
    covidProvider = Provider.of<CovidProvider>(context, listen: false);
  }

  Future<void> getCovidList() async {
    try {
      final response = await http.httpGet(ENDPOINTS.covidList);
      if (response.statusCode == 200) {
        final _decoded = jsonDecode(utf8.decode(response.bodyBytes)) as List;
        final _covidList =
            _decoded.map((entry) => CovidModel.fromJson(entry)).toList();
        covidProvider.setCovidList(_covidList);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void setSortList(SortCovid sortValue, bool orderValue) {
    covidProvider.setSortList(sortValue, orderValue);
  }

  filterCovidList(String value) {
    covidProvider.filterCovidList(StringsUtils.removeDiactrics(value));
  }

  String getTotalCasesByRegion(String region) {
    final total =
        covidProvider.originalCovidList.fold(0.0, (currentTotal, element) {
      if (element.region == region) return currentTotal + element.cases;

      return currentTotal;
    });

    return total.toString();
  }

  String getTotalDeathsByRegion(String region) {
    final total =
        covidProvider.originalCovidList.fold(0.0, (currentTotal, element) {
      if (element.region == region) return currentTotal + element.deaths;

      return currentTotal;
    });

    return total.toString();
  }
}
