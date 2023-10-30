import 'package:bikecare/src/config/presentation/utils/constants/strings.dart';
import 'package:bikecare/src/config/presentation/widgets/mileage_tracker_card.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildProfileWidget(),
            const MileageTrackingCard(mileage: 4229),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: _buildHeader(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildGreetingUser(),
          _buildUsername('John Doe'),
          const Divider(thickness: 1)
        ],
      ),
    );
  }

  Widget _buildUsername(String username) {
    return Text(
      username,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildGreetingUser() {
    return const Text(
      greetingMessage,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
