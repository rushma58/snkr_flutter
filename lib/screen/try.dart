import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SNKR Nepal'),
        backgroundColor: const Color(0XFFF7931E),
        elevation: 0,
      ),
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/6690f6c0c3fb85929e3e70be/1i2j47ob9',
        visitor: TawkVisitor(
          name: 'Ayoub AMINE',
          email: 'ayoubamine2a@gmail.com',
        ),
        onLoad: () {
          print('Hello Tawk!');
        },
        onLinkTap: (String url) {
          print(url);
        },
        placeholder: const Center(
          child: Text('Loading...'),
        ),
      ),
      // body: const WebView(
      //   initialUrl: 'https://tawk.to/chat/6690f6c0c3fb85929e3e70be/1i2j47ob9',
      //   javascriptMode: JavascriptMode.unrestricted,
      // ),
    );
  }
}
