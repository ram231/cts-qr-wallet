import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'pages/dashboard/dashboard_scaffold.dart';
import 'pages/dashboard/tracker/cubit/covid_tracker_cubit.dart';
import 'pages/login/login_scaffold.dart';
import 'pages/register/cubit/cts_register_cubit.dart';
import 'pages/register/register_scaffold.dart';
import 'pages/scanner/scanner_scaffold.dart';

part 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = CtsObserver();
  runApp(const CtsApp());
}

class CtsObserver extends BlocObserver {
  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    debugPrint(error.toString());
    super.onError(cubit, error, stackTrace);
  }
}

class CtsBlocs extends StatelessWidget {
  const CtsBlocs({
    @required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CovidTrackerCubit(),
        ),
      ],
      child: child,
    );
  }
}

class CtsApp extends StatelessWidget {
  const CtsApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CtsSplashScreen(),
      onGenerateRoute: ctsRoute,
    );
  }
}

class CtsSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CtsLoginScaffold();
  }
}
