import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../facts/bloc/cat_fact_state.dart';
import '../cat_error.dart';
import '../cat_loader.dart';
import 'bloc/cat_image_bloc.dart';
import 'bloc/cat_image_state.dart';

class CatRandomImageWidget extends StatelessWidget {
  const CatRandomImageWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CatImageBloc, CatImageState>(
        builder: (context, state) {
          return state.state.isLoading || state.state.isPrepared
              ? const SizedBox(width: 150, height: 150, child: CatLoader())
              : state.state.isReady
                  ? SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48), // Image radius
                          child: Image.network(
                              (state as CatImageStateReady).image.url,
                              fit: BoxFit.cover),
                        ),
                      ))
                  : const CatError();
        },
      );
}
