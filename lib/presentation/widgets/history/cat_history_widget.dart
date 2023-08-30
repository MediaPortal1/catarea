import 'package:flutter/material.dart';

import '../../../domain/cats/entity/cat_fact.dart';

class CatHistoryListWidget extends StatelessWidget {
  final List<CatFact> catFactsStory;

  const CatHistoryListWidget(this.catFactsStory, {super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: catFactsStory.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Text(catFactsStory[index].text, style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),);
      });
}
