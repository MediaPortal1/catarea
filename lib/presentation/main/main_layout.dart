import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../history/history_page.dart';
import '../widgets/cat_error.dart';
import '../widgets/cat_loader.dart';
import '../widgets/facts/bloc/cat_fact_event.dart';
import '../widgets/facts/bloc/cat_fact_state.dart';
import '../widgets/facts/bloc/cat_facts_bloc.dart';
import '../widgets/facts/cat_facts_widget.dart';
import '../widgets/image/bloc/cat_image_bloc.dart';
import '../widgets/image/bloc/cat_image_event.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFFFF80AB),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.of(context).pushNamed(ROUTE_HISTORY);
            },
          )
        ],
        title: const Text(
          "Facts about cats",
          style:
              TextStyle(color: Colors.pinkAccent, fontStyle: FontStyle.italic),
        ),
      ),
      floatingActionButton: OutlinedButton(
          onPressed: () {
            BlocProvider.of<CatFactsBloc>(context).add(NewCatFactEvent());
            BlocProvider.of<CatImageBloc>(context).add(CatImageLoadingEvent());
          },
          child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Another fact!",
                style: TextStyle(color: Colors.white),
              ))),
      body: getBody());

  Widget getBody() =>
      BlocBuilder<CatFactsBloc, CatFactsState>(builder: (context, state) {
        switch (state.catState) {
          case CatState.ready:
            return const Center(child: CatFactWidget());
          case CatState.loading:
            return const Center(child: CatLoader());
          case CatState.prepared:
            return const Center(child: CatLoader());
          case CatState.failed:
            return const CatError();
        }
      });
}
