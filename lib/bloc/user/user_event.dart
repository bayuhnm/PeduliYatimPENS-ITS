part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserGetById extends UserEvent {
  final int id;
  const UserGetById(this.id);

  @override
  List<Object> get props => [id];
}

class UserGetRecent extends UserEvent {}
