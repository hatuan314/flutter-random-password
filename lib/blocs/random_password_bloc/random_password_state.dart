import 'package:equatable/equatable.dart';

abstract class RandomPasswordState extends Equatable {

}

class RandomPasswordInitialState extends RandomPasswordState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class RandomPasswordLoadingState extends RandomPasswordState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class RandomPasswordSuccessState extends RandomPasswordState {
  final String compexPassword;

  RandomPasswordSuccessState(this.compexPassword);
  @override
  // TODO: implement props
  List<Object> get props => [this.compexPassword];

}

class RandomPasswordFailureState extends RandomPasswordState {
  final String error;

  RandomPasswordFailureState(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [this.error];

  @override
  String toString() => "RandomPasswordFailureState - Error Message: {$error}";
}