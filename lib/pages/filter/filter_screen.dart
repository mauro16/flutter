import 'package:flutter/material.dart';
import 'package:makemebela/models/filter-model.dart';
import 'package:makemebela/pages/filter/widgets/section_title.dart';

import 'widgets/animated_button.dart';
import 'widgets/order_by_field.dart';
import 'widgets/price_range_field.dart';
import 'widgets/vendor_type_field.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  Filter _filter = Filter(
    minPrice: 100,
    maxPrice: 10,
    vendorType: VENDOR_TYPE_SALON,
    orderBy: OrderBy.PRICE,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Suche filtern"),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const SectionTitle(title: "Sortiere nach"),
                OrderByField(
                  initialValue: _filter.orderBy,
                  onSaved: (v) {
                    _filter.orderBy = v;
                  },
                ),
                const SectionTitle(title: "Hause besuch?"),
                const SectionTitle(title: "Ich suche einen:"),
                VendorTypeField(
                  initialValue: _filter.vendorType,
                  onSaved: (v) {
                    _filter.vendorType = v;
                  },
                ),
                const SectionTitle(title: "Preisklasse"),
                PriceRangeField(
                  filter: _filter,
                ),
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_filter.maxPrice != null && _filter.minPrice != null) {
                  if (_filter.minPrice > _filter.maxPrice) {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("Falsche Preisspanne"),
                        backgroundColor: Colors.pink,
                      ),
                    );
                    return;
                  }
                }
                //Salvar tudo e pesquisar anuncio
              }
            },
          ),
        ],
      ),
    );
  }
}
