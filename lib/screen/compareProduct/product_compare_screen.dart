import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:snkr_flutter/feature/shoeComparision/shoe_comparision_model.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/snkr_navbar.dart';

class ProductCompareScreen extends StatefulWidget {
  const ProductCompareScreen({super.key});

  @override
  State<ProductCompareScreen> createState() => _ProductCompareScreenState();
}

class _ProductCompareScreenState extends State<ProductCompareScreen> {
  TextEditingController shoe1Controller = TextEditingController();
  TextEditingController shoe2Controller = TextEditingController();
  late final String apiKey;
  ShoeComparison? comparisonResult;
  bool isLoading = true;
  String? errorMessage = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAPIKey().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> getAPIKey() async {
    await dotenv.load(fileName: ".env");
    apiKey = dotenv.env['API_KEY'] ?? 'API key not found';
    debugPrint('API Key: $apiKey');
    if (apiKey == "") {
      debugPrint('API Key is empty!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SnkrNavbar(
          appBarName: "Compare",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomTextField(
                controller: shoe1Controller,
                labelText: "Shoes 1",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == "") {
                    return ("This field is required");
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: shoe2Controller,
                labelText: "Shoes 2",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == "") {
                    return ("This field is required");
                  }
                  return null;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    String shoe1 = shoe1Controller.text;
                    String shoe2 = shoe2Controller.text;
                    final model = GenerativeModel(
                        model: 'gemini-1.5-flash', apiKey: apiKey);
                    // final prompt =
                    //     'Compare $shoe1 and $shoe2 by material used, price, quality, popularity and then provide the verdicts according to it on which shoe to buy.';

                    // final prompt =
                    //     "Compare $shoe1 and $shoe2 by Performance (lightness, cushioning, flexibility, responsive, stability, grip) and rate it out of 10 where 10 is excellent and 0 is worst, strike, price and then provide the verdicts according to it on which shoe to buy.";

                    // final prompt =
                    //     "Compare $shoe1 and $shoe2 by Performance (lightness, cushioning, flexibility, responsive, stability, grip) and rate it out of 10 where 10 is excellent and 0 is worst, strike, price and then provide the verdicts according to it on which shoe to buy. I need the response in Map<String, String> format.{'shoe1':{'name':'','lightness': ,'cushioning':,.....'strike':,'price':,},'shoe2':{'name':'','lightness': ,'cushioning':,.....'strike':,'price':,}'verdict':'',}in this format, I just need JSON format, i dont need any other explanations.";

                    final prompt =
                        "Compare $shoe1 and $shoe2 by Performance (lightness, cushioning, flexibility, stability, grip), price and rate it out of 10 where 10 is excellent and 0 is worst. Then provide the verdicts according to it on which shoe to buy. Also, remember that the price should be always in the dollar format as \$. I need the response in Map<String, String> format.{'shoe1':{'name':'','lightness': ,'cushioning':,.....'strike':,'price':,},'shoe2':{'name':'','lightness': ,'cushioning':,.....'strike':,'price':,}'verdict':{'Choose shoe1 if':'','Choose shoe2 if':''},}in this format, I just need JSON format, i dont need any other explanations.";
                    final content = [Content.text(prompt)];
                    try {
                      final response = await model.generateContent(content);
                      debugPrint(response.text);

                      // Preprocess the response text
                      String responseText = response.text!;
                      int jsonStart = responseText.indexOf('{');
                      int jsonEnd = responseText.lastIndexOf('}');
                      if (jsonStart == -1 || jsonEnd == -1) {
                        throw const FormatException(
                            'No valid JSON found in the response');
                      }
                      String jsonString =
                          responseText.substring(jsonStart, jsonEnd + 1);

                      // Parse the cleaned JSON response
                      final Map<String, dynamic> jsonResponse =
                          jsonDecode(jsonString);
                      final ShoeComparison comparison =
                          ShoeComparison.fromJson(jsonResponse);
                      debugPrint(comparison.toString());

                      setState(() {
                        comparisonResult = comparison;
                        isLoading = false;
                      });
                    } catch (e) {
                      debugPrint('Error generating content: $e');
                      setState(() {
                        isLoading = false;
                        errorMessage =
                            'An error occurred while comparing shoes: $e';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cBlack,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: const Text(
                    "Compare",
                    style: fWhiteSemiBold16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const CircularProgressIndicator()
              else if (comparisonResult != null)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "${comparisonResult!.shoe1['name']} VS ${comparisonResult!.shoe2['name']}",
                        style: fBlackSemiBold18,
                      ),
                    ),
                    DataTable(
                      dataRowMinHeight: 30,
                      dataRowMaxHeight: 50,
                      columnSpacing: 15,
                      headingRowColor:
                          WidgetStateColor.resolveWith((states) => cGrayOld),
                      headingRowHeight: 50,
                      columns: [
                        const DataColumn(
                          label: Expanded(
                            child: Text(
                              "Comparison",
                              style: fWhiteSemiBold12,
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              "${comparisonResult!.shoe1['name']}",
                              style: fWhiteSemiBold12,
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              "${comparisonResult!.shoe2['name']}",
                              style: fWhiteSemiBold12,
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        _buildDataRow(
                            "Lightness",
                            comparisonResult!.shoe1['lightness'],
                            comparisonResult!.shoe2['lightness']),
                        _buildDataRow(
                            "Cushioning",
                            comparisonResult!.shoe1['cushioning'],
                            comparisonResult!.shoe2['cushioning']),
                        _buildDataRow(
                            "Flexibility",
                            comparisonResult!.shoe1['flexibility'],
                            comparisonResult!.shoe2['flexibility']),
                        _buildDataRow(
                            "Stability",
                            comparisonResult!.shoe1['stability'],
                            comparisonResult!.shoe2['stability']),
                        _buildDataRow("Grip", comparisonResult!.shoe1['grip'],
                            comparisonResult!.shoe2['grip']),
                        _buildDataRow("Price", comparisonResult!.shoe1['price'],
                            comparisonResult!.shoe2['price']),
                        // _buildDataRow(
                        //     "Strike",
                        //     comparisonResult!.shoe1['strike'],
                        //     comparisonResult!.shoe2['strike']),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      tileColor: cGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      title: const Text(
                        "Verdict",
                        style: fBlackSemiBold14,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose ${comparisonResult!.shoe1['name']} if:",
                            style: fBlackRegular14,
                          ),
                          Text(
                            " ${comparisonResult!.verdict['Choose shoe1 if']}",
                            style: fBlackRegular14,
                          ),
                          Text(
                            "Choose ${comparisonResult!.shoe2['name']} if:",
                            style: fBlackRegular14,
                          ),
                          Text(
                            " ${comparisonResult!.verdict['Choose shoe2 if']}",
                            style: fBlackRegular14,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              else
                Text(errorMessage ?? 'No comparison results available.'),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow(String label, dynamic value1, dynamic value2) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            label,
            style: fBlackRegular12,
            textAlign: TextAlign.center,
          ),
        ),
        DataCell(
          Center(
            child: Text(
              value1?.toString() ?? '-',
              style: fBlackRegular12,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              value2?.toString() ?? '-',
              style: fBlackRegular12,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
