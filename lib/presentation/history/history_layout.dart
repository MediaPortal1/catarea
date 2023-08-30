import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cats/entity/cat_fact.dart';
import '../widgets/cat_error.dart';
import '../widgets/cat_loader.dart';
import '../widgets/facts/bloc/cat_fact_state.dart';
import '../widgets/history/bloc/cat_history_bloc.dart';
import '../widgets/history/bloc/cat_history_state.dart';

class CatFactsHistoryLayout extends StatelessWidget {
  const CatFactsHistoryLayout({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("Your favourite")),
      body: getBody());

  Widget getBody() =>
      BlocBuilder<CatHistoryBloc, CatHistoryState>(builder: (context, state) {
        switch (state.catHistoryState) {
          case CatState.ready:
            List<CatFact> history = (state as CatHistoryReadyState).history;
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      height: 90,
                      color: index % 2 == 0
                          ? Colors.pink.withAlpha(20)
                          : Colors.pink.withAlpha(40),
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                '${history[index].text}',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18),
                              )),
                              const SizedBox(width: 32),
                              Text(
                                  '${history[index].createdAt.substring(0, 10)}')
                            ],
                          )));
                },
                itemCount: history.length);
          case CatState.loading || CatState.prepared:
            return const Center(child: CatLoader());
          default:
            return const CatError();
        }
      });
}
