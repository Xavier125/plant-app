import 'package:flutter/material.dart';

class CardInputWidget extends StatelessWidget {
  const CardInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Billing Info',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Card Holder Name',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter card holder number',
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Card Number',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter card number',
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Expiry Date',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'MM/YY',
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'CVV',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter card CVV',
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
