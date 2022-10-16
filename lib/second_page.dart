import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class Second_Page extends StatefulWidget {
  const Second_Page({super.key});
  static const routeName = "/second_page";

  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  TextEditingController _balance = TextEditingController();
  var _key1 = GlobalKey<DropdownSearchState<Person>>();
  var _key2 = GlobalKey<DropdownSearchState<Person>>();
  var selecteditem1;
  var selecteditem2;
  var newbalance1;
  var newbalance2;

  EasyTableModel<Person>? _model;
  final _formKey = GlobalKey<FormState>();
  bool showbalance = false;
  @override
  void initState() {
    super.initState();

    _model = EasyTableModel<Person>(rows: rows, columns: [
      EasyTableColumn(
        name: 'Name',
        stringValue: (row) => row.name,
        headerPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        headerTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        width: 150,
      ),
      EasyTableColumn(
        name: 'Email',
        stringValue: (row) => row.email,
        headerPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        headerTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        width: 150,
      ),
      EasyTableColumn(
        name: 'Id',
        intValue: (row) => row.id,
        headerPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        headerTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        width: 100,
      ),
      EasyTableColumn(
        name: 'Balance',
        doubleValue: (row) => row.balance,
        headerPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        headerTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        width: 100,
      ),
    ]);
  }

  List<Person> rows = [
    Person('Mina Magdy', 111, "mina@test.com", 2500),
    Person('Magdy Ali', 222, "magdy@test.com", 5000),
    Person('Yousry Mohamed', 333, "yousry@test.com", 3500),
    Person('Ahmed Mohsen', 444, "ahmed@test.com", 1500),
    Person('Oliver Botros', 555, "oliver@test.com", 700),
    Person('Merna Atef', 666, "merna@test.com", 1000),
    Person('Sara Sherif', 777, "sara@test.com", 10000),
    Person('Mona ALi', 888, "mona@test.com", 6000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#047aed"),
      appBar: AppBar(
        title: Text("Main Page"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                hoverColor: Colors.red,
                splashColor: Colors.brown,
                onTap: () {
                  setState(() {
                    showbalance = true;
                  });
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Colors.black),
                    // color: Colors.yellow,
                  ),
                  child: Text(
                    "Transformation",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            if (showbalance == true)
              Container(
                width: 500,
                height: 300,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownSearch<Object>(
                        key: _key1,
                        items: rows
                            .map(
                              (items) => items.name,
                            )
                            .toList(),
                        // dropdownBuilder:
                        //     (BuildContext context, Person? selecteditem) {
                        //   return Text(r"hello");
                        // },
                        popupProps: PopupProps.menu(
                          // showSelectedItems: true,
                          showSearchBox: true,

                          // disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),

                            labelText: "Choose Sender",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            // hintText: "country in menu mode",
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selecteditem1 = value;
                          });
                        },
                      ),
                      DropdownSearch<Object>(
                        key: _key2,
                        items: rows
                            .map(
                              (items) => items.name,
                            )
                            .toList(),
                        popupProps: PopupProps.menu(
                          showSearchBox: true,

                          // disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),

                            labelText: "Choose Receiver",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            // hintText: "country in menu mode",
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selecteditem2 = value;
                          });
                        },
                      ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            )),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          controller: _balance,
                          enabled: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          savefun();
                          balancechanged();

                          setState(() {
                            rows[rows.indexWhere(
                                    (element) => element.name == selecteditem1)]
                                .balance = newbalance1;
                            rows[rows.indexWhere(
                                    (element) => element.name == selecteditem2)]
                                .balance = newbalance2;
                          });
                        },
                        icon: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              width: 505,
              height: 295,
              child: EasyTable<Person>(_model),
            ),
          ],
        ),
      )),
    );
  }

  savefun() {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
  }

  balancechanged() {
    newbalance1 =
        rows[rows.indexWhere((element) => element.name == selecteditem1)]
                .balance -
            num.parse(_balance.text);
    newbalance2 =
        rows[rows.indexWhere((element) => element.name == selecteditem2)]
                .balance +
            num.parse(_balance.text);
  }
}

class Person {
  Person(this.name, this.id, this.email, this.balance);

  final String name;
  final int id;
  final String email;
  double balance;
}
