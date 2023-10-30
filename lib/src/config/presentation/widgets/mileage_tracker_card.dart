import 'package:bikecare/src/config/presentation/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MileageTrackingCard extends StatelessWidget {
  final int mileage;
  const MileageTrackingCard({super.key, required this.mileage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildCard(),
          _buildLastUpdateBanner(),
        ],
      ),
    );
  }

  Widget _buildLastUpdateBanner() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: const Center(
        child: Text(
          'Last updated: 12 Aug 2023',
          style: TextStyle(
              color: Colors.white, fontSize: 11, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text(
                  currentMileage,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                _buildRichText(),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Mileage Log',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRichText() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: _setToDecimalPattern(mileage),
            style: const TextStyle(
                color: Colors.black, fontSize: 50, fontWeight: FontWeight.w700),
          ),
          const TextSpan(
            text: 'km',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ],
      ),
    );
  }

  String _setToDecimalPattern(int mileage) =>
      NumberFormat.decimalPattern().format(mileage);
}
