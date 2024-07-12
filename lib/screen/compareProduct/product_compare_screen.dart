import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:snkr_flutter/screen/compareProduct/compare_page.dart';

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
  String comparisonResult = '';
  bool isLoading = true;

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

                    final prompt =
                        "Compare $shoe1 and $shoe2 by Performance (lightness, cushioning, flexibility, responsive, stability, grip) and rate it out of 10 where 10 is excellent and 0 is worst, strike, price and then provide the verdicts according to it on which shoe to buy.";
                    final content = [Content.text(prompt)];
                    try {
                      final response = await model.generateContent(content);
                      debugPrint(response.text);

                      setState(() {
                        comparisonResult =
                            response.text ?? 'No comparison available';
                        isLoading = false;
                      });
                    } catch (e) {
                      debugPrint('Error generating content: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cBlack,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    "Compare",
                    style: fWhiteSemiBold16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                  visible: isLoading,
                  child: const CircularProgressIndicator(
                    color: cBlack,
                  )),
              if (comparisonResult.isNotEmpty)
                ComparisonResult(comparison: comparisonResult),
            ],
          ),
        ),
      ),
    );
  }
}
