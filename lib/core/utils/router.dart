import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:socially/core/bloc/timer/timer_cubit.dart';
import 'package:socially/features/home/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:socially/features/home/presentation/pages/home_page.dart';
import 'package:socially/features/story/pages/story_page.dart';
import 'package:socially/injection_container.dart';

class Routes {
  static String home = '/home';
  static String story = 'story';
}

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => NoTransitionPage(
        child: BlocProvider(
          create: (context) => sl<PostsBloc>(),
          child: const HomePage(),
        ),
      ),
      routes: [
        GoRoute(
          path: Routes.story,
          pageBuilder: (context, state) => SlideTransitionPage(
            child: BlocProvider(
              create: (context) => sl<TimerCubit>(),
              child: const StoryPage(),
            ),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) =>
      const NoTransitionPage(child: PageNotFound()),
);

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Page Not Found',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                onPressed: () {
                  if (GoRouter.of(context).canPop()) {
                    Navigator.pop(context);
                  } else {
                    context.go(Routes.home);
                  }
                },
                child: Text(GoRouter.of(context).canPop() ? 'Back' : 'Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  /// Constructor for a page with slide transition functionality.
  const SlideTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: const Duration(milliseconds: 300),
        );

  static Widget _transitionsBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: tween.animate(animation),
      child: child,
    );
  }
}

Route createSlideRoute({required Widget child, required BuildContext context}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: tween.animate(animation),
        child: child,
      );
    },
  );
}
