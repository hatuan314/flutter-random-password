import 'dart:convert';
import 'dart:math';

import 'package:createsecurepassword/blocs/random_password_bloc/random_password_event.dart';
import 'package:createsecurepassword/blocs/random_password_bloc/random_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomPasswordBloc
    extends Bloc<RandomPasswordEvent, RandomPasswordState> {
  @override
  // TODO: implement initialState
  RandomPasswordState get initialState => RandomPasswordInitialState();

  @override
  Stream<RandomPasswordState> mapEventToState(
      RandomPasswordEvent event) async* {
    // TODO: implement mapEventToState
    if (event is CreatePassButtonOnPress) {
      yield RandomPasswordLoadingState();
      Random _random = Random.secure();
      var values = List<int>.generate(8, (i) => _random.nextInt(93) + 33);
      yield RandomPasswordSuccessState(ascii.decode(values));
    }
  }
}
