import 'package:http/http.dart' as http;
import 'package:counter_7/model/my_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/model/budget.dart';
import 'dart:convert';

import 'form.dart';
import 'my_watchlist_page.dart';

class MyWatchlistRincianPage extends StatefulWidget {
  MyWatchlistRincianPage({Key? key, required this.budgets, required this.movie})
      : super(key: key);

  MyWatchlist movie;
  List<Budget> budgets;

  @override
  State<MyWatchlistRincianPage> createState() =>
      _MyWatchlistRincianPageState(budgets, movie);
}

class _MyWatchlistRincianPageState extends State<MyWatchlistRincianPage> {
  List<Budget> budgets;
  MyWatchlist movie;
  _MyWatchlistRincianPageState(this.budgets, this.movie);

  Future<List<MyWatchlist>> fetchMyWatchlist() async {
    var url =
        Uri.parse('https://tugas2-pbp-alek.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<MyWatchlist> watchlist = [];
    for (var d in data) {
      if (d != null) {
        watchlist.add(MyWatchlist.fromJson(d));
      }
    }

    return watchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rincian Watchlist'),
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                // Menambahkan clickable menu
                ListTile(
                  title: const Text('counter_7'),
                  onTap: () {
                    // Route menu ke halaman utama
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                title: 'Program Counter',
                                budgets: budgets,
                              )),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Form Budget'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyFormPage(
                                budgets: budgets,
                              )),
                    );
                  },
                ),
                ListTile(
                  title: Text('Data Budget'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyDataPage(budgets: budgets)),
                    );
                  },
                ),
                ListTile(
                  title: Text('My Watchlist'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyWatchlistPage(
                                budgets: budgets,
                              )),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.fields.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Released Date: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.releaseDate.toString())
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rating: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.rating.toString())
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((movie.fields.watched) ? 'Watched' : 'Not watched')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Review: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.review)
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Route menu ke halaman form
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyWatchlistPage(
                          budgets: budgets,
                        ),
                      ),
                    );
                  },
                  child: Text("Back"))
            ],
          ),
        ));
  }
}
