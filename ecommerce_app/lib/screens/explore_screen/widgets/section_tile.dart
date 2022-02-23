import 'package:ecommerce_app/models/section.dart';
import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/providers/location_provider.dart';
import 'package:ecommerce_app/screens/shops_screen/shops_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({Key? key, required this.section}) : super(key: key);
  final Section section;


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        context.read<GeneralProvider>().selectedSectionId = section.id;
        Navigator.of(context).pushNamed(ShopsScreen.namedRoute);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset('assets/icons/${section.imageURL}')),
            SizedBox(
              height: 10,
            ),
            Text(
                section.name,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
