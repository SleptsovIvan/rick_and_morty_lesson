import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_lesson/dependency_injection/app_component.dart';
import 'package:rick_and_morty_lesson/features/home/state/home_cubit.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';
import 'package:rick_and_morty_lesson/services/rick_and_morty_api/api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<void> _future;

  @override
  void initState() {
    _future = context.read<HomeCubit>().getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await context.read<HomeCubit>().getCharacters();
                      } catch (e) {
                        inspect(e);
                      }
                    },
                    child: Text('Get characters'),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  sliver: SliverList.separated(
                    itemCount: state.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Character character = state.characters[index];
                      return Text(character.name);
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return SizedBox(height: 8);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
