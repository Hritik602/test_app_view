import 'package:flutter/material.dart';
import 'package:tes_app_wiew/app_webview.dart';

class InputFieldScreen extends StatefulWidget {
  const InputFieldScreen({super.key});

  @override
  State<InputFieldScreen> createState() => _InputFieldScreenState();
}

class _InputFieldScreenState extends State<InputFieldScreen> {
  TextEditingController _urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Type URL"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: onClicked, child: const Text('Click')))
          ],
        ),
      ),
    );
  }

  void onClicked() {
    if (_urlController.text.isEmpty) {
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AppWebView(
                    baseUrl: _urlController.text,
                  )));
    }
  }
}
