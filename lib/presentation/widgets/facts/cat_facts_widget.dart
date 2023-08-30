import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../image/cat_image_widget.dart';
import 'bloc/cat_fact_event.dart';
import 'bloc/cat_fact_state.dart';
import 'bloc/cat_facts_bloc.dart';

class CatFactWidget extends StatelessWidget {
  const CatFactWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CatFactsBloc, CatFactsState>(builder: (context, state) {
        var currentState = state as CatFactReadyState;
        return ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 300, minHeight: 300, maxWidth: 300, maxHeight: 400),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white24),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CatRandomImageWidget(),
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('\“${state.fact.text}\”',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic))),
                      IconButton.outlined(
                          splashColor: Colors.white,
                          onPressed: () {
                            BlocProvider.of<CatFactsBloc>(context)
                                .add(CatFactLikedEvent());
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: state.isLiked ? Colors.red : Colors.white,
                          ))
                    ])));
      });
}
