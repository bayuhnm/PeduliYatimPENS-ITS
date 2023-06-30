import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/detail_donation_program.page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/donation_list.dart';
import 'package:peduli_yatim_pens_mobile/widgets/percentage_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peduli_yatim_pens_mobile/bloc/donation_program/donation_program_bloc.dart';

class DonationListPage extends StatefulWidget {
  const DonationListPage({super.key});

  @override
  State<DonationListPage> createState() => DonationListPageState();
}

class DonationListPageState extends State<DonationListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGreyColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 70),
        children: [
          Container(
            child: BlocProvider(
              create: (context) =>
                  DonationProgramBloc()..add(DonationProgramGet()),
              child: BlocBuilder<DonationProgramBloc, DonationProgramState>(
                builder: (context, state) {
                  if (state is DonationProgramSuccess) {
                    final temporaryPrograms = state.data
                        .where((donationProgram) =>
                            donationProgram.programType == 'temporary')
                        .toList();

                    if (temporaryPrograms.isEmpty) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Center(
                          child: Text('Tidak ada donasi terbaru'),
                        ),
                      );
                    }

                    return Column(
                      children: temporaryPrograms.map((donationProgram) {
                        return DonationList(
                          data: donationProgram,
                          currentDonateAmount:
                              donationProgram.currentDonateAmount,
                          endAt: donationProgram.endAt,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailDonationPage(
                                  data: donationProgram,
                                  currentDonateAmount:
                                      donationProgram.currentDonateAmount,
                                  donateGoal: donationProgram.donateGoal,
                                  endAt: donationProgram.endAt,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  }
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1 / 2,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
