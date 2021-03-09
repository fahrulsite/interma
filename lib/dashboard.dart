import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Interma"),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Shibernika',
                ),
                Tab(
                  text: 'Seminar Nasional',
                ),
                Tab(
                  text: 'Elination',
                ),
                Tab(
                  text: 'PAB',
                ),
                Tab(
                  text: 'Kunjungan Industri',
                ),
                Tab(
                  text: 'Temu Jurusan',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("Shibernika"),
              ),
              Center(
                child: Text("Seminar Nasional"),
              ),
              Center(
                child: Text("Elination"),
              ),
              Center(
                child: Text("PAB"),
              ),
              Center(
                child: Text("Kunjungan Industri"),
              ),
              Center(
                child: Text("Temu Jurusan"),
              ),
            ],
          ),
        ));
  }
}
