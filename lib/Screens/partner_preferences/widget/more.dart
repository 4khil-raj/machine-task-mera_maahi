// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mere_maahi_dummy/application/partner_pref/partner_pref_bloc.dart';

class MoreButtonPartnerPreference extends StatelessWidget {
  const MoreButtonPartnerPreference({super.key, required this.more});
  final bool more;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => BlocProvider.of<PartnerPrefBloc>(context)
            .add(PartnerMoreButtonEvent(more: more)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              more ? 'Less' : 'More',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 7,
            ),
            Icon(more
                ? Icons.arrow_circle_up
                : Icons.keyboard_arrow_down_rounded)
          ],
        ),
      ),
    );
  }
}

class TextPartenrPreference extends StatelessWidget {
  const TextPartenrPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 9,
        ),
        Text('You will see Matches based on the Preferences'),
        Text('You have set')
      ],
    );
  }
}
