import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class RatingBlocListener extends StatelessWidget {
  const RatingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieDetailsCubit, MovieDetailsState>(
      listenWhen: (previous, current) =>
          current is LoadingRatingMovie ||
          current is SuccessRatingMovie ||
          current is ErrorRatingMovie,
      listener: (context, state) {
        if (state is SuccessRatingMovie) {
          showSuccessDialog(context);
        } else if (state is ErrorRatingMovie) {
          setupErrorState(context, state.error);
        } else if (state is LoadingRatingMovie) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.iconColor,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    context.pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.primaryCardColor,
          title: Text(
            'Rating Movie Successfully',
            style: TextStyles.font18Gray500,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.iconColor,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pop();
                context.pop();
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String message) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsManager.primaryCardColor,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          message,
          style: TextStyles.font18Gray500,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font18PrimaryTextColor500,
            ),
          ),
        ],
      ),
    );
  }
}
