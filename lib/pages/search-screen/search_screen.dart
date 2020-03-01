import 'package:flutter/material.dart';
import 'package:makemebela/blocs/home_bloc.dart';
import 'package:provider/provider.dart';
import 'top_bar.dart';
import 'widgets/search_dialog.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeBloc _homeBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final HomeBloc homeBloc = Provider.of<HomeBloc>(context);
    if (homeBloc != _homeBloc) {
      // se nao for igal ao estado antigo receba o estado novo "homeBloc"
      _homeBloc = homeBloc;
    }
  }

  @override
  Widget build(BuildContext context) {
    _openSearch(String currentSearch) async {
      final String search = await showDialog(
        context: context,
        builder: (context) => SearchDialog(currentSearch: currentSearch),
      );
      if (search != null) {
        _homeBloc.setSearch(search);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: _homeBloc.outSearch,
          initialData: '',
          builder: (context, snapshot) {
            if (snapshot.data.isEmpty) {
              return Container();
            } else {
              return GestureDetector(
                onTap: () => _openSearch(snapshot.data),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      child: Text(snapshot.data),
                      width: constraints.biggest.width,
                    );
                  },
                ),
              );
            }
          },
        ),
        actions: <Widget>[
          StreamBuilder<String>(
            stream: _homeBloc.outSearch,
            initialData: '',
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _openSearch('');
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _homeBloc.setSearch('');
                  },
                );
              }
            },
          )
        ],
        elevation: 10.0,
      ),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
    );
  }
}
