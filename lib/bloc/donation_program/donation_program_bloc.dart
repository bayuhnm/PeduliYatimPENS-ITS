import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peduli_yatim_pens_mobile/models/donation_program_model.dart';
import 'package:peduli_yatim_pens_mobile/services/donation_program_service.dart';

part 'donation_program_event.dart';
part 'donation_program_state.dart';

class DonationProgramBloc extends Bloc<DonationProgramEvent, DonationProgramState> {
  DonationProgramBloc() : super(DonationProgramInitial()) {
    on<DonationProgramEvent>((event, emit) async {
      if (event is DonationProgramGet) {
        try {
          emit(DonationProgramLoading());

          final res = await DonationProgramService().getDonationPrograms();

          emit(DonationProgramSuccess(res));
        } catch (e) {
          emit(DonationProgramFailed(e.toString()));
        }
      }
    });
  }
}