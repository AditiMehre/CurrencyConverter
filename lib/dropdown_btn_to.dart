import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DropDownBtnOutput extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  const DropDownBtnOutput({Key? key, this.onChanged}) : super(key: key);  // Corrected this line

  @override
  State<DropDownBtnOutput> createState() => DropDownBtnOutputState();
}

class DropDownBtnOutputState extends State<DropDownBtnOutput> {
  List<String> currencyList = ['INR']; // Added a default value
  String selectedCurrency = 'INR';

  @override
  void initState() {
    super.initState();
    fetchCurrencies();
  }

  fetchCurrencies() async {
    var url = 'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_uysT5Q2jBsq328R8fsMhx392ZXpb8se5u6LMSHjf';
    var response = await http.get(Uri.parse(url));
    // print('Data from API: ${json.decode(response.body)}');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['data'] != null) { // Added a null check
        setState(() {
          currencyList = data['data'].keys.toList().cast<String>();
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
    return
      Center(  // Wrapped in a Center widget
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
