import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_lesson/features/details/state/details_cubit.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';

class DetailsView extends StatefulWidget {
  final int id;
  const DetailsView({super.key, required this.id});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late final _detailFuture;

  @override
  void initState() {
    _detailFuture = context.read<DetailsCubit>().getDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _detailFuture,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                if (snapshot.hasError) {
                  return Column(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.errorMessage ?? 'Some error...'),
                      ElevatedButton(
                        onPressed: () async {
                          await context.read<DetailsCubit>().getDetail(
                            widget.id,
                          );
                        },
                        child: Text('Try again'),
                      ),
                    ],
                  );
                }

                final Character character = state.details!;
                return CustomScrollView(slivers: [
                    
                  ],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
