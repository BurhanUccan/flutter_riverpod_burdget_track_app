import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/all_providers.dart';

class PieChartFilter extends ConsumerWidget {
  PieChartFilter({super.key});
  var _currentTimeFilter = TimeFilter.today;
  Color changeTextColor(TimeFilter filt, var context) {
    return _currentTimeFilter == filt
        ? Colors.amber
        : Theme.of(context).colorScheme.onBackground;
  }

// filtre tetiklenmesi public olmalı ve her tetiklendiğinde liste güncellensin
// iki farklı liste olacak
// ve hem charttaki veriler hem de liste verileri bu liste üzerinden getirilecek
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _currentTimeFilter = ref.watch(timeFilterProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TimeFilter.today, context)),
            onPressed: () {
              ref.read(timeFilterProvider.notifier).state = TimeFilter.today;
            },
            child: const Text('bugün')),
        TextButton(
          style: TextButton.styleFrom(
              primary: changeTextColor(TimeFilter.thisWeek, context)),
          onPressed: () {
            ref.read(timeFilterProvider.notifier).state = TimeFilter.thisWeek;
          },
          child: const Text("bu hafta"),
        ),
        TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TimeFilter.thisMonth, context)),
            onPressed: () {
              ref.read(timeFilterProvider.notifier).state =
                  TimeFilter.thisMonth;
            },
            child: const Text("bu ay")),
      ],
    );
  }
}
