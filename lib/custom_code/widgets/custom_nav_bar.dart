// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  // Track the selected button
  int _selectedIndex = 0;

  // Define the navigation destinations
  final List<String> _pages = [
    '/homePage',
    '/vitalsPage',
    '/medicationPage',
    '/educationPage',
    '/journalPage',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 60.0,
      color: FlutterFlowTheme.of(context).primaryBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.search, 1),
          _buildNavItem(Icons.notifications, 2),
          _buildNavItem(Icons.person, 3),
          _buildNavItem(Icons.person, 4),
        ],
      ),
    );
  }

  // Helper method to build each navigation item
  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon),
      color: _selectedIndex == index
          ? FlutterFlowTheme.of(context).primaryColor
          : FlutterFlowTheme.of(context).secondaryText,
      onPressed: () {
        setState(() {
          _selectedIndex = index; // Update the selected index
        });
        Navigator.pushNamed(context, _pages[index]);
      },
    );
  }
}
