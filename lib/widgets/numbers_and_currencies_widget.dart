import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/widgets/_custom_text_widget.dart';

class NumberAndCurrenciesWidget extends StatelessWidget {
  const NumberAndCurrenciesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomText(
      title: l10n.numberAndCurrenciesTitle,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.simpleCurrencyContent(25)),
          Text(l10n.compactLongContent(274000000, 'Indonesia')),
          Text(l10n.percentContent(0.03, 'Indonesia')),
        ],
      ),
    );
  }
}
