import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      home: Scaffold(
        backgroundColor: backgroundGreyColor,
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 70),
          children: [
            Container(
              child: BlocProvider(
                            create: (context) => DonationProgramBloc()
                              ..add(DonationProgramGet()),
                            child: BlocBuilder<DonationProgramBloc,
                                DonationProgramState>(
                              builder: (context, state) {
                                if (state is DonationProgramSuccess) {
                                  final temporaryPrograms = state.data
                                      .where((donationProgram) =>
                                          donationProgram.programType ==
                                          'temporary')
                                      .toList();

                                  return Column(
                                    children: temporaryPrograms
                                        .map((donationProgram) {
                                      return DonationList();
                                    }).toList(),
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
            )
          ],
        ),
      ),
    );
  }
}
