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

import 'dart:async';

class StoryScreen extends StatefulWidget {
  const StoryScreen({
    super.key,
    this.width,
    this.height,
    required this.stories,
    required this.endCallback,
  });

  final double? width;
  final double? height;
  final List<String> stories;
  final Future Function() endCallback;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  double _progress = 0.0;
  late Timer _timer;
  final int _storyDuration = 10; // Duration per story in seconds
  bool _isPaused = false; // New flag to track pause state

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  void _startTimer() {
    _progress = 0.0;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!_isPaused) {
        // Check if paused before updating progress
        setState(() {
          _progress += 0.01; // Adjusted for 5-second duration
          if (_progress >= 1.0) {
            _nextStory();
          }
        });
      }
    });
  }

  void _restartTimer() {
    _timer.cancel();
    _startTimer();
  }

  void _pauseStory() {
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeStory() {
    setState(() {
      _isPaused = false;
    });
  }

  void _nextStory() {
    if (_currentIndex < widget.stories.length - 1) {
      _currentIndex++;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _restartTimer();
    } else {
      _timer.cancel();
      widget.endCallback(); // Trigger end callback
    }
  }

  void _previousStory() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _restartTimer();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: Row(
              children: List.generate(widget.stories.length, (index) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: const Color(0x295D6A85),
                    ),
                    child: LinearProgressIndicator(
                      value: index == _currentIndex
                          ? _progress
                          : (index < _currentIndex ? 1.0 : 0.0),
                      backgroundColor: Colors.transparent,
                      color: const Color(0xFFEC698B),
                    ),
                  ),
                );
              }),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: widget.stories.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    widget.stories[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFEC698B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          GestureDetector(
            onTapUp: (details) {
              final width = MediaQuery.of(context).size.width;
              if (details.globalPosition.dx < width / 2) {
                _previousStory();
              } else {
                _nextStory();
              }
            },
            onLongPressStart: (_) => _pauseStory(), // Pause on long press
            onLongPressEnd: (_) => _resumeStory(), // Resume when released
          ),
        ],
      ),
    );
  }
}
