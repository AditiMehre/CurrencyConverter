import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DropDownBtnInput extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  const DropDownBtnInput({Key? key, this.onChanged})
      : super(key: key); // Corrected this line

  @override
  State<DropDownBtnInput> createState() => _DropDownBtnInputState();
}

class _DropDownBtnInputState extends State<DropDownBtnInput> {
  List<String> currencyList = ['INR']; // Added a default value
  String selectedCurrency = 'INR';

  @override
  void initState() {
    super.initState();
    fetchCurrencies();
  }

  fetchCurrencies() async {
    var url =
        'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_uysT5Q2jBsq328R8fsMhx392ZXpb8se5u6LMSHjf';
    var response = await http.get(Uri.parse(url));
    // print('Data from API: ${json.decode(response.body)}'
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Raw API Response: ${response.body}');

      if (data['data'] != null) {
        // Added a null check
        setState(() {
          currencyList = data['data'].keys.toList().cast<String>();
          if (currencyList.contains('USD')) {
            // Check if 'USD' exists in the list
            selectedCurrency = 'USD';
          } else if (currencyList.isNotEmpty) {
            // Fallback to first item if list is not empty
            selectedCurrency = currencyList[0];
          }
        });
      } else {
        print('Currencies data is null');
      }
    } else {
      print('Failed to load currencies from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Wrapped in a Center widget
      child: DropdownButton<String>(
        value: selectedCurrency,
        items: currencyList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(color: Colors.black)),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedCurrency = newValue!;
          });
          widget.onChanged?.call(newValue);
        },
      ),
    );
  }
}
