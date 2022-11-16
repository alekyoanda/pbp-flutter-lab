import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/budget.dart';

class MyDataPage extends StatefulWidget {
  List<Budget> budgets;

  MyDataPage({super.key, required this.budgets});

  @override
  State<MyDataPage> createState() => _MyDataPageState(budgets);
}

class _MyDataPageState extends State<MyDataPage> {
  List<Budget> budgets;
  _MyDataPageState(this.budgets);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Budget'),
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
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: budgets.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
              child: ListTile(
                title: Text(
                  budgets[index].judul,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((budgets[index].nominal).toString()),
                        Text(budgets[index].jenisBudget)
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
