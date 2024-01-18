import 'package:currency_converter/dropdown_btn_to.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'animating_bg.dart';
import 'dropdown_btn_from.dart';
import 'model_class.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  //VARIABLES
  var border = const OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside),
    borderRadius: BorderRadius.all(Radius.circular(35)),
  );
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  String fromCurrency = "USD";
  String toCurrency = "INR";
  late CurrencyRates currencyRates;
  bool isLoading = false;

  // API FETCH
  Future<CurrencyRates> fetchCurrencyRates() async {
    setState(() {
      isLoading = true;
    });
    Response response = await http.get(Uri.parse(
        'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_uysT5Q2jBsq328R8fsMhx392ZXpb8se5u6LMSHjf'));
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      currencyRates = CurrencyRates.fromJson(json.decode(response.body));
      print("Currency Rates: ${response.body}");
      print("200 okay ");
      print("Currency Rates: ${currencyRates.toJson()}");

      // throw Exception('Failed to load currency rates');
      return currencyRates;
    } else {
      print('good good but not ok');
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load currency rates');
      // return null;
    }
  }

  //network calls
  //heavy computation task

  // CURRENCY CONVERSION HANDLER
  void convert() {
    print("Convert method called.");
    print("Entered amount: ${textEditingController.text}");
    print("From currency: $fromCurrency");
    print("To currency: $toCurrency");
    print("Conversion Result: $result");

    setState(() {
      if (textEditingController.text.isNotEmpty &&
          fromCurrency != null &&
          toCurrency != null) {
        double amount = double.parse(textEditingController.text);
        double rate =
            1.0; // default rate if conversion is within the same currency

        switch (fromCurrency) {
          case 'AUD':
            rate = currencyRates?.aud ?? 1.0;
            break;
          case 'BGN':
            rate = currencyRates?.bgn ?? 1.0;
            break;
          case 'BRL':
            rate = currencyRates?.brl ?? 1.0;
            break;
          case 'CAD':
            rate = currencyRates?.cad ?? 1.0;
            break;
          case 'CHF':
            rate = currencyRates?.chf ?? 1.0;
            break;
          case 'CNY':
            rate = currencyRates?.cny ?? 1.0;
            break;
          case 'CZK':
            rate = currencyRates?.czk ?? 1.0;
            break;
          case 'DKK':
            rate = currencyRates?.dkk ?? 1.0;
            break;
          case 'EUR':
            rate = currencyRates?.eur ?? 1.0;
            break;
          case 'GBP':
            rate = currencyRates?.gbp ?? 1.0;
            break;
          case 'HKD':
            rate = currencyRates?.hkd ?? 1.0;
            break;
          case 'HRK':
            rate = currencyRates?.hrk ?? 1.0;
            break;
          case 'HUF':
            rate = currencyRates?.huf ?? 1.0;
            break;
          case 'IDR':
            rate = currencyRates?.idr ?? 1.0;
            break;
          case 'ILS':
            rate = currencyRates?.ils ?? 1.0;
            break;
          case 'INR':
            rate = currencyRates?.inr ?? 1.0;
            break;
          case 'ISK':
            rate = currencyRates?.isk ?? 1.0;
            break;
          case 'JPY':
            rate = currencyRates?.jpy ?? 1.0;
            break;
          case 'KRW':
            rate = currencyRates?.krw ?? 1.0;
            break;
          case 'MXN':
            rate = currencyRates?.mxn ?? 1.0;
            break;
          case 'MYR':
            rate = currencyRates?.myr ?? 1.0;
            break;
          case 'NOK':
            rate = currencyRates?.nok ?? 1.0;
            break;
          case 'NZD':
            rate = currencyRates?.nzd ?? 1.0;
            break;
          case 'PHP':
            rate = currencyRates?.php ?? 1.0;
            break;
          case 'PLN':
            rate = currencyRates?.pln ?? 1.0;
            break;
          case 'RON':
            rate = currencyRates?.ron ?? 1.0;
            break;
          case 'RUB':
            rate = currencyRates?.rub ?? 1.0;
            break;
          case 'SEK':
            rate = currencyRates?.sek ?? 1.0;
            break;
          case 'SGD':
            rate = currencyRates?.sgd ?? 1.0;
            break;
          case 'THB':
            rate = currencyRates?.thb ?? 1.0;
            break;
          case 'TRY':
            rate = currencyRates?.tryCurrency ?? 1.0;
            break;
          case 'USD':
            rate = currencyRates?.usd ?? 1.0;
            break;
          case 'ZAR':
            rate = currencyRates?.zar ?? 1.0;
            break;
          default:
            rate = 1.0;
            break;
        }

        switch (toCurrency) {
          case 'AUD':
            result = amount * (currencyRates?.aud ?? 1.0) / rate;
            break;
          case 'BGN':
            result = amount * (currencyRates?.bgn ?? 1.0) / rate;
            break;
          case 'BRL':
            result = amount * (currencyRates?.brl ?? 1.0) / rate;
            break;
          case 'CAD':
            result = amount * (currencyRates?.cad ?? 1.0) / rate;
            break;
          case 'CHF':
            result = amount * (currencyRates?.chf ?? 1.0) / rate;
            break;
          case 'CNY':
            result = amount * (currencyRates?.cny ?? 1.0) / rate;
            break;
          case 'CZK':
            result = amount * (currencyRates?.czk ?? 1.0) / rate;
            break;
          case 'DKK':
            result = amount * (currencyRates?.dkk ?? 1.0) / rate;
            break;
          case 'EUR':
            result = amount * (currencyRates?.eur ?? 1.0) / rate;
            break;
          case 'GBP':
            result = amount * (currencyRates?.gbp ?? 1.0) / rate;
            break;
          case 'HKD':
            result = amount * (currencyRates?.hkd ?? 1.0) / rate;
            break;
          case 'HRK':
            result = amount * (currencyRates?.hrk ?? 1.0) / rate;
            break;
          case 'HUF':
            result = amount * (currencyRates?.huf ?? 1.0) / rate;
            break;
          case 'IDR':
            result = amount * (currencyRates?.idr ?? 1.0) / rate;
            break;
          case 'ILS':
            result = amount * (currencyRates?.ils ?? 1.0) / rate;
            break;
          case 'INR':
            result = amount * (currencyRates?.inr ?? 1.0) / rate;
            break;
          case 'ISK':
            result = amount * (currencyRates?.isk ?? 1.0) / rate;
            break;
          case 'JPY':
            result = amount * (currencyRates?.jpy ?? 1.0) / rate;
            break;
          case 'KRW':
            result = amount * (currencyRates?.krw ?? 1.0) / rate;
            break;
          case 'MXN':
            result = amount * (currencyRates?.mxn ?? 1.0) / rate;
            break;
          case 'MYR':
            result = amount * (currencyRates?.myr ?? 1.0) / rate;
            break;
          case 'NOK':
            result = amount * (currencyRates?.nok ?? 1.0) / rate;
            break;
          case 'NZD':
            result = amount * (currencyRates?.nzd ?? 1.0) / rate;
            break;
          case 'PHP':
            result = amount * (currencyRates?.php ?? 1.0) / rate;
            break;
          case 'PLN':
            result = amount * (currencyRates?.pln ?? 1.0) / rate;
            break;
          case 'RON':
            result = amount * (currencyRates?.ron ?? 1.0) / rate;
            break;
          case 'RUB':
            result = amount * (currencyRates?.rub ?? 1.0) / rate;
            break;
          case 'SEK':
            result = amount * (currencyRates?.sek ?? 1.0) / rate;
            break;
          case 'SGD':
            result = amount * (currencyRates?.sgd ?? 1.0) / rate;
            break;
          case 'THB':
            result = amount * (currencyRates?.thb ?? 1.0) / rate;
            break;
          case 'TRY':
            result = amount * (currencyRates?.tryCurrency ?? 1.0) / rate;
            break;
          case 'USD':
            result = amount * (currencyRates?.usd ?? 1.0) / rate;
            break;
          case 'ZAR':
            result = amount * (currencyRates?.zar ?? 1.0) / rate;
            break;
          default:
            result =
                amount; // Return the same amount if no conversion is available
            break;
        }
        print("Result after conversion: $result");
      } else {
        result = 0;
        print("Result after conversion: $result");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    try {
      await fetchCurrencyRates();
      snackbar("Fetched Successfully", success: true);
    } catch (e) {
      snackbar("Something went wrong while fetching currency rates.",
          error: true);
    } finally {
      snackbar("Finnaly called");
    }
  }

  // void fetch() {
  //   fetchCurrencyRates().then((value) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Currency Rates Fetched Successfully")));
  //   }).catchError((e, stack) {
  //     print(e);
  //     print(stack);
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text("Something went wrong while fetching currency rates")));
  //   }).whenComplete(() {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("When Complete Called")));
  //   });
  // }

  void snackbar(String msg, {bool? success, bool? error}) {
    Color? backgroundColor;
    if (success ?? false) {
      backgroundColor = Colors.green;
    }
    if (error ?? false) {
      backgroundColor = Colors.red;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: backgroundColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // VARIABLE

    // MAIN BODY STARTS HERE DOWN
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Currency Converter ',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : buildStack(),
    );
  }

  Stack buildStack() {
    return Stack(
      children: [
        AnimatedGradientBackground(),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                buildDropDown(),
                buildTextResult(),
                const SizedBox(
                  height: 16,
                ),
                buildTextFieldAmount(border),
                const SizedBox(
                  height: 16,
                ),
                buildConvertButton()
              ],
            ),
          ),
        ),
      ],
    );
  }

//REFRACTED METHODS DOWN
  ElevatedButton buildConvertButton() {
    return ElevatedButton(
      onPressed: convert,
      // don't use convert() , coz void return type func cant be assign to onpressed
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: const Text(
        'Convert',
      ),
    );
  }

  TextField buildTextFieldAmount(OutlineInputBorder border) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.black, fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white60,
        prefixIcon: Icon(
          Icons.monetization_on,
          color: Colors.white60,
        ),
        hintText: 'Please enter the amount in USD',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }

  Text buildTextResult() {
    return Text(
      '${toCurrency ?? "Currency"}: ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
      // int to string till 2 decimal
      style: const TextStyle(
          fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Row buildDropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'From ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        // SizedBox(width: 10,),
        DropDownBtnInput(
          currencyList: currencyRates,
          onChanged: (value) {
            setState(() {
              fromCurrency = value ?? '';
            });
          },
          selectedCurrency: fromCurrency,
        ),
        const Text(
          'To ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        DropDownBtnInput(
          selectedCurrency: toCurrency,
          onChanged: (value) {
            setState(() {
              toCurrency = value ?? '';
            });
          },
          currencyList: currencyRates,
        ),
      ],
    );
  }
}
