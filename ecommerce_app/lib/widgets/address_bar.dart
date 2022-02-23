import 'package:ecommerce_app/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<LocationProvider>().determineCurrentLocation();
    var _currentLocation = context.read<LocationProvider>().currentLocation;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Delivering to',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5,),
        Row(
            children: [
              SvgPicture.asset('assets/icons/location.svg'),
              Text(
                _currentLocation.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
                ],


        ),
      ],
    );
  }
}
