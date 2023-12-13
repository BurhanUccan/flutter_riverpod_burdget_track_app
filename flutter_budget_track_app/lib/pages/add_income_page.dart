import 'package:flutter/material.dart';

import 'package:flutter_budget_track/general_widgets/category_element.dart';
import 'package:flutter_budget_track/general_widgets/custom_text.dart';
import 'package:flutter_budget_track/general_widgets/general_text.dart';
import 'package:flutter_budget_track/models/budget_model.dart';
import 'package:flutter_budget_track/providers/add_nutton_manager.dart';

import 'package:flutter_budget_track/providers/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddIncomeWidget extends ConsumerWidget {
  AddIncomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allCategories = ref.watch(filteredCategoryListProvider);
    var selectedCategory = ref.watch(selectedCategoryProvider);
    var _textController = ref.watch(textControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Tsextfield
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: TextField(
                onChanged: (value) {
                  ref.read(textControllerProvider.notifier).updateText(value);
                },
                controller: _textController.textController,
                cursorColor: Theme.of(context).colorScheme.onBackground,
                autofocus: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  focusColor: Theme.of(context).colorScheme.onBackground,
                  hoverColor: Theme.of(context).colorScheme.onBackground,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GeneralCustomTextWidget(
              text: "Katagoriler",
              fontSize: 20,
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allCategories.length,
                itemBuilder: (context, index) => CategoryElementWidget(
                  isSelected: selectedCategory == index,
                  onTap: () {
                    ref.read(selectedCategoryProvider.notifier).state = index;
                  },
                  color: allCategories[index].color,
                  icon: allCategories[index].icon,
                  iconSize: 30,
                  title: allCategories[index].title,
                ),
              ),
            ),

            SizedBox(
              height: 50.h,
            ),
            Center(
              //eğer tutar yazılmamışsa veya categori seçilmemişse buton disabled olsun
              child: ElevatedButton(
                  onPressed: ref.watch(addButtonProvider)
                      ? () {
                          int selectedIndex =
                              ref.read(selectedCategoryProvider);
                          if (_textController.textController.text.isNotEmpty ||
                              selectedIndex == -1) {
                          } else {
                            var selectedPage = ref.read(budgetFilterProvider);
                            ref.read(BudgetListProvider.notifier).addBudget(
                                  BudgetModel(
                                    category: allCategories[selectedIndex],
                                    tip: selectedPage == BudgetFilter.gelir
                                        ? true
                                        : false,
                                    tutar: double.parse(
                                        _textController.textController.text),
                                    zaman: DateTime.now(),
                                  ),
                                );
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, // Arka plan rengi - Sarı
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Oval şeklinde yapmak için kenar yuvarlaklığı
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 100.w,
                        vertical: 10), // Buton içeriği için iç ve dış boşluklar
                  ),
                  child: CustomTextWidget(
                    text: "Ekle",
                    color: Colors.black,
                    fontSize: 25,
                    isBold: true,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
