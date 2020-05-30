import 'dart:convert';
import 'dart:math';

import 'package:createsecurepassword/blocs/random_password_bloc/random_password_event.dart';
import 'package:createsecurepassword/blocs/random_password_bloc/random_password_state.dart';
import 'package:createsecurepassword/common/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'random_password_event.dart';
import 'random_password_state.dart';

class RandomPasswordBloc
    extends Bloc<RandomPasswordEvent, RandomPasswordState> {
  bool _isSelectOnlyNumber = false;
  bool _isSelectPasswordLenghtOption = false;

  @override
  // TODO: implement initialState
  RandomPasswordState get initialState => RandomPasswordInitialState(
      _isSelectOnlyNumber, _isSelectPasswordLenghtOption);

  @override
  Stream<RandomPasswordState> mapEventToState(
      RandomPasswordEvent event) async* {
    // TODO: implement mapEventToState
    if (event is CreatePassButtonOnPress)
      yield* _mapCreatePassButtonEventToState(event.lengthPassword);
    if (event is SelectOnlyNumberOptionOnPresEvent)
      yield* _mapSelectOnlyNumberEventToState(event.isSelect);
    if (event is SelectPasswordLengthOptionsOnPressEvent)
      yield* _mapSelectPasswordLenghtOptionEventToState(event.isSelect);
  }

  Stream<RandomPasswordState> _mapCreatePassButtonEventToState(
      String lengthPassword) async* {
    yield RandomPasswordLoadingState(
        _isSelectOnlyNumber, _isSelectPasswordLenghtOption);
    int length = 8;
    if (validationNumber(lengthPassword))
      length = int.parse(lengthPassword);
    debugPrint(length.toString());
    String randomPassword = '';
    if (_isSelectOnlyNumber == true) {
      randomPassword = await _randomNumberPassword(length);
    } else {
      randomPassword = await _randomStrongPassword(length);
    }

    yield RandomPasswordSuccessState(
        randomPassword, _isSelectOnlyNumber, _isSelectPasswordLenghtOption);
  }

  Future<String> _randomNumberPassword(int length) async {
    Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(9) + 48);
    return ascii.decode(values);

  }

  Future<String> _randomStrongPassword(int length) async {
    Random _random = Random.secure();
    String randomPassword = '';
    do {
      var values = List<int>.generate(length, (i) {
        int randomNumber;
         do {
          randomNumber = _random.nextInt(89) + 33;
        } while (noSafeCharacter.contains(randomNumber));
        return randomNumber;
      });
      randomPassword = ascii.decode(values);
      debugPrint(validationStrongPassword(randomPassword).toString());
    } while (!validationStrongPassword(randomPassword));
    return randomPassword;
  }

  Stream<RandomPasswordState> _mapSelectOnlyNumberEventToState(
      bool isSelect) async* {
    yield RandomPasswordLoadingState(
        _isSelectOnlyNumber, _isSelectPasswordLenghtOption);
    _isSelectOnlyNumber = isSelect;
    yield RandomPasswordInitialState(
        _isSelectOnlyNumber, _isSelectPasswordLenghtOption);
  }

  Stream<RandomPasswordState> _mapSelectPasswordLenghtOptionEventToState(
      bool isSelect) async* {
    yield RandomPasswordLoadingState(
        _isSelectOnlyNumber, _isSelectPasswordLenghtOption);
    _isSelectPasswordLenghtOption = isSelect;
    yield RandomPasswordInitialState(
        _isSelectOnlyNumber, _isSelectPasswordLenghtOption);
  }
}
