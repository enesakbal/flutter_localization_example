import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/widgets/_custom_text_widget.dart';

class TextWithPluralWidget extends StatelessWidget {
  const TextWithPluralWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    //* Text with plural
    return CustomText(
      title: l10n.nKangaroosTitle,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(l10n.nKangaroosContent(0)), //* Returns '0 kangaroos'
          Text(l10n.nKangaroosContent(1)), //* Returns '1 kangaroo'
          Text(l10n.nKangaroosContent(12)), //* Returns '12 kangaroos'
        ],
      ),
    );
  }
}
