import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/constants.dart';

class CopyToClipboardButton extends StatelessWidget {
  const CopyToClipboardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Clipboard.setData(const ClipboardData(text: exampleText)).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(clipboardSnackbarMessage),
            ),
          );
        });
      },
      icon: const Icon(Icons.copy),
      iconSize: 18,
      visualDensity: VisualDensity.compact,
      tooltip: clipboardTooltip,
      color: Colors.black,
    );
  }
}
