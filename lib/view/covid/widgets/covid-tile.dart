import 'package:covid_carlos_alito/core/models/covid.model.dart';
import 'package:flutter/material.dart';

class CovidTile extends StatefulWidget {
  final CovidModel item;

  CovidTile({@required this.item});

  @override
  _CovidTileState createState() => _CovidTileState();
}

class _CovidTileState extends State<CovidTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.item.state),
                Text(widget.item.region),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Casos: ${widget.item.cases.toString()}'),
                Text('Mortes: ${widget.item.deaths.toString()}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
