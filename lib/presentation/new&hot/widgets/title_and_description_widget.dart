import 'package:flutter/material.dart';

class TitleAndDescrptionWidget extends StatelessWidget {
  const TitleAndDescrptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "The Batman",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[300],
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
          style:
              TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
        )
      ],
    );
  }
}
