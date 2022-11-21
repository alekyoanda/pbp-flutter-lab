import 'package:counter_7/page/my_watchlist_rincian_page.dart';
import 'package:http/http.dart' as http;
import 'package:counter_7/model/my_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/model/budget.dart';
import 'dart:convert';

import 'form.dart';

class MyWatchlistPage extends StatefulWidget {
  MyWatchlistPage({Key? key, required this.budgets}) : super(key: key);

  List<Budget> budgets;

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState(budgets);
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  List<Budget> budgets;
  _MyWatchlistPageState(this.budgets);

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
          title: Text('My Watchlist'),
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
        body: FutureBuilder(
            future: fetchMyWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada my watchlist :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 4),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: (snapshot.data![index].fields.watched)
                            ? Border.all(width: 2.0, color: Colors.green)
                            : Border.all(width: 2.0, color: Colors.red),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "${snapshot.data![index].fields.title}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Route menu ke halaman form
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyWatchlistRincianPage(
                                budgets: budgets,
                                movie: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
