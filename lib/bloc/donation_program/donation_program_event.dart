part of 'donation_program_bloc.dart';

abstract class DonationProgramEvent extends Equatable {
  const DonationProgramEvent();

  @override
  List<Object> get props => [];
}

class DonationProgramGet extends DonationProgramEvent {}
