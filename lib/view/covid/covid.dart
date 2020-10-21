import 'package:covid_carlos_alito/core/service/covid.service.dart';
import 'package:covid_carlos_alito/view/covid/widgets/covid-body.dart';
import 'package:covid_carlos_alito/view/covid/widgets/covid-header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CovidScreen extends StatefulWidget {
  @override
  _CovidScreenState createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      loading = true;
      final CovidService covidService = CovidService(context);
      await covidService.getCovidList();
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid stats'),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                CovidHeader(),
                Expanded(
                  child: CovidBody(),
                )
              ],
            ),
    );
  }
}
