import 'package:equatable/equatable.dart';

abstract class RandomPasswordEvent extends Equatable {}

class CreatePassButtonOnPress extends RandomPasswordEvent {
  final String lengthPassword;

  CreatePassButtonOnPress(this.lengthPassword);
  @override
  // TODO: implement props
  List<Object> get props => [this.lengthPassword];
}

class SelectOnlyNumberOptionOnPresEvent extends RandomPasswordEvent {
  final bool isSelect;

  SelectOnlyNumberOptionOnPresEvent(this.isSelect);

  @override
  // TODO: implement props
  List<Object> get props => [this.isSelect];
}

class SelectPasswordLengthOptionsOnPressEvent extends RandomPasswordEvent {
  final bool isSelect;

  SelectPasswordLengthOptionsOnPressEvent(this.isSelect);

  @override
  // TODO: implement props
  List<Object> get props => [this.isSelect];
}
