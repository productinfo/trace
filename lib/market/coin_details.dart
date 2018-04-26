import 'package:flutter/material.dart';

import 'package:trace/main.dart';
import 'package:trace/market/coin_aggregate_stats.dart';
import 'package:trace/market/coin_exchanges_list.dart';

class CoinDetails extends StatefulWidget {
  CoinDetails({this.snapshot});
  final snapshot;

  @override
  CoinDetailsState createState() => new CoinDetailsState();
}

class CoinDetailsState extends State<CoinDetails> {
  String toSym = "USD"; //TODO: setting for this

  @override
  Widget build(BuildContext context) {

    final _aggregateStats = new AggregateStats(snapshot: widget.snapshot, toSym: toSym);
    final _marketList = new MarketList(snapshot: widget.snapshot, toSym: toSym);

    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: new PreferredSize(
              preferredSize: const Size.fromHeight(75.0),
              child: new AppBar(
                titleSpacing: 0.0,
                elevation: 0.0,
                title: new Text(widget.snapshot["name"]),
                bottom: new PreferredSize(
                    preferredSize: const Size.fromHeight(25.0),
                    child: new Container(
                        height: 30.0,
                        child: new TabBar(
                          indicatorColor: Theme.of(context).iconTheme.color,
                          tabs: <Widget>[
                            new Tab(text: "Aggregate Stats"),
                            new Tab(text: "Markets"),
                          ],
                        ))),
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                _aggregateStats,
                _marketList
              ],
            )));
  }
}
