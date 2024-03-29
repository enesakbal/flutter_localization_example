import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/widgets/_custom_text_widget.dart';

class BasicPlaceholderTextWidget extends StatelessWidget {
  const BasicPlaceholderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    //* Text with parameters
    return CustomText(
      title: l10n.basicPlaceholderTitle,
      content: Text(
        l10n.basicPlaceholderContent(
          'Enes',
          22,
          2.5,
          DateTime(2001, 07, 29),
          'Istanbul, Türkiye',
        ),
      ),
    );
  }
}
