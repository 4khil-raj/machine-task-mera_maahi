import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mere_maahi_dummy/Screens/partner_preferences/widget/basic.dart';
import 'package:mere_maahi_dummy/Screens/partner_preferences/widget/community.dart';
import 'package:mere_maahi_dummy/Screens/partner_preferences/widget/location.dart';
import 'package:mere_maahi_dummy/Screens/partner_preferences/widget/more.dart';
import 'package:mere_maahi_dummy/application/partner_pref/partner_pref_bloc.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/education.dart';

class PartnerPreferences extends StatelessWidget {
  PartnerPreferences({super.key});
  bool more = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 236, 236),
      appBar: AppBar(
        title: const Text('Partner Preferences'),
        centerTitle: true,
      ),
      body: BlocBuilder<PartnerPrefBloc, PartnerPrefState>(
        builder: (context, state) {
          if (state is PartnerPrefMoreButtonState) {
            more = state.more;
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                const TextPartenrPreference(),
                const BasicPartnerPreferance(),
                const CommunityPartnerPreferance(),
                more
                    ? const Column(
                        children: [
                          LocationPartnerPreferance(),
                          EducationDetalsProfile(),
                        ],
                      )
                    : MoreButtonPartnerPreference(
                        more: more,
                      ),
                more
                    ? MoreButtonPartnerPreference(
                        more: more,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
