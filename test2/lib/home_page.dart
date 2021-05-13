import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/lang/localization_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lgn = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter is hot'),
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: _uiWidget(),
      ),
    );
  }

  Widget _uiWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'hello_title'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(""),
            new DropdownButton<String>(
              items: LocalizationService.langs.map(
                (String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                },
              ).toList(),
              value: this.lgn,
              underline: Container(
                color: Colors.transparent,
              ),
              isExpanded: false,
              onChanged: (newVal) {
                setState(() {
                  this.lgn = newVal;
                  LocalizationService().changeLocale(newVal);
                });
              },
            )
          ],
        )
      ],
    );
  }
}
