import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:todos_repository/todos_repository.dart';

import 'app.dart';

///Initializes and sets up the core components of the flutter framework
///before the app starts running
void bootstrap({required TodosApi todosApi}) {

  ///Handles uncaught exceptions and logs them
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () => runApp(App(todosRepository: todosRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class AppBlocObserver extends BlocObserver{
  const AppBlocObserver();
}
