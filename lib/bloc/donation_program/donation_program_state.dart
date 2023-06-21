part of 'donation_program_bloc.dart';

abstract class DonationProgramState extends Equatable {
  const DonationProgramState();

  @override
  List<Object> get props => [];
}

class DonationProgramInitial extends DonationProgramState {}

class DonationProgramLoading extends DonationProgramState {}

class DonationProgramFailed extends DonationProgramState {
  final String e;
  const DonationProgramFailed(this.e);

  @override
  List<Object> get props => [e];
}

class DonationProgramSuccess extends DonationProgramState {
  final List<DonationProgramModel> data;
  const DonationProgramSuccess(this.data);

  @override
  List<Object> get props => [data];
}
