import 'package:covid_carlos_alito/core/models/covid.model.dart';
import 'package:flutter/material.dart';

class CovidButton extends StatefulWidget {
  final String title;
  final Function action;
  final bool orderAsc;
  final SortCovid sortedBy;
  final SortCovid defaultValueSort;

  CovidButton({
    @required this.action,
    @required this.title,
    this.orderAsc,
    this.sortedBy,
    this.defaultValueSort,
  });
  @override
  _CovidButtonState createState() => _CovidButtonState();
}

class _CovidButtonState extends State<CovidButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        child: InkWell(
          onTap: widget.action,
          child: Ink(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.defaultValueSort == widget.sortedBy)
                  Icon(widget.orderAsc
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: widget.defaultValueSort == widget.sortedBy
                          ? Colors.red
                          : Colors.black,
                      fontWeight: widget.defaultValueSort == widget.sortedBy
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
