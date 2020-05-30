import 'package:equatable/equatable.dart';

abstract class RandomPasswordState extends Equatable {
  final bool isSelectOnlyNumber;
  final bool isSelectPasswordLenghtOption;

  RandomPasswordState(
      this.isSelectOnlyNumber, this.isSelectPasswordLenghtOption);
}

class RandomPasswordInitialState extends RandomPasswordState {
  RandomPasswordInitialState(
      bool isSelectOnlyNumber, bool isSelectPasswordLenghtOption)
      : super(isSelectOnlyNumber, isSelectPasswordLenghtOption);

  @override
  // TODO: implement props
  List<Object> get props => [this.isSelectOnlyNumber];
}

class RandomPasswordLoadingState extends RandomPasswordState {
  RandomPasswordLoadingState(
      bool isSelectOnlyNumber, bool isSelectPasswordLenghtOption)
      : super(isSelectOnlyNumber, isSelectPasswordLenghtOption);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SelectOnlyNumberOnPressState extends RandomPasswordState {
  SelectOnlyNumberOnPressState(
      bool isSelectOnlyNumber, bool isSelectPasswordLenghtOption)
      : super(isSelectOnlyNumber, isSelectPasswordLenghtOption);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SelectPasswordLenghtOptionState extends RandomPasswordState {
  SelectPasswordLenghtOptionState(
      bool isSelectOnlyNumber, bool isSelectPasswordLenghtOption)
      : super(isSelectOnlyNumber, isSelectPasswordLenghtOption);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RandomPasswordSuccessState extends RandomPasswordState {
  final String compexPassword;

  RandomPasswordSuccessState(this.compexPassword, bool isSelectOnlyNumber,
      bool isSelectPasswordLenghtOption)
      : super(isSelectOnlyNumber, isSelectPasswordLenghtOption);

  @override
  // TODO: implement props
  List<Object> get props => [this.compexPassword];
}

class RandomPasswordFailureState extends RandomPasswordState {
  final String error;

  RandomPasswordFailureState(
      this.error, bool isSelectOnlyNumber, bool isSelectPasswordLenghtOption)
      : super(isSelectOnlyNumber, isSelectPasswordLenghtOption);

  @override
  // TODO: implement props
  List<Object> get props => [this.error];

  @override
  String toString() => "RandomPasswordFailureState - Error Message: {$error}";
}
