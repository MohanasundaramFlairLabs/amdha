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

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    super.key,
    this.width,
    this.height,
    required this.firstName,
    required this.lastName,
    this.profilePicUrl,
    required this.backgroundColor,
  });

  final double? width;
  final double? height;
  final String firstName;
  final String lastName;
  final String? profilePicUrl;
  final Color backgroundColor;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.profilePicUrl == null ? widget.backgroundColor : null,
        image: widget.profilePicUrl != null
            ? DecorationImage(
                image: NetworkImage(widget.profilePicUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: widget.profilePicUrl == null
          ? Center(
              child: Text(
                '${widget.firstName.isNotEmpty ? widget.firstName[0].toUpperCase() : ''}${widget.lastName.isNotEmpty ? widget.lastName[0].toUpperCase() : ''}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
