import 'package:flutter/material.dart';
import 'package:latex_app/common/constants.dart';
import 'package:latex_app/widgets/copy_to_clipboard_button.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          aboutPageTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                text: aboutContent,
                children: [
                  TextSpan(
                    text: aboutContentTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(),
                  ),
                  child: const SelectableText(exampleText),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CopyToClipboardButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
