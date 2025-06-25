import 'package:flutter/material.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class DevelopedByWidget extends StatelessWidget {
  const DevelopedByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const Text('Designed & Developed By'),
            sizedBoxHeight(10),
            const Image(
              image: AssetImage('images/msegs_logo.png'),
            ),
            const Text('(A Government of Mizoram Undertaking)'),
            sizedBoxHeight(20),
          ],
        ),
      ),
    );
  }
}
