import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makemebela/models/filter-model.dart';

class PriceRangeField extends StatelessWidget {
  PriceRangeField({this.filter});
  final Filter filter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Min.",
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            /* initialValue: filter.minPrice?.toString(),
            onSaved: (s) {
              if (s.isEmpty) {
                filter.minPrice = null;
              } else {
                filter.minPrice = int.parse(getSanitizedText(s));
              }
            },
           validator: (s) {
              if (s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null) {
                return 'Ungültige Nummer';
              } else {
                return null;
              }
            },*/
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Max.",
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            /* initialValue: filter.maxPrice?.toString(),
             onSaved: () { if (s.isEmpty) {
                filter.maxPrice = null;
              } else {
                filter.maxPrice = int.parse(getSanitizedText(s));
              }
              },
            validator: (s) {
              if (s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null) {
                return 'Ungültige Nummer';
              } else {
                return null;
              }
            },*/
          ),
        ),
      ],
    );
  }
}
