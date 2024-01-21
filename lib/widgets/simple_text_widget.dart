import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/widgets/_custom_text_widget.dart';

class SimpleTextWidget extends StatelessWidget {
  const SimpleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomText(
      title: l10n.simpleTextTitle,
      content: Text(l10n.simpleTextContent),
    );
  }
}
