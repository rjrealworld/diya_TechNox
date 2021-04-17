import 'dart:ui';
import 'package:diya/screens/onboarding/models/onboard_page_model.dart';
import 'package:flutter/material.dart';

List<OnboardPageModel> onboardData = [
  OnboardPageModel(
      Color(0xFFFFFFFF),
      Color(0xFF005699),
      Color(0xFFFFE074),
      2,
      'assets/images/onboard_.png',
      'EMOTIONAL',
      'GLOOM',
      'Emotions can be messy, complicated, and downright confusing sometimes. We are here to aid you through your emotional gloom.'),
  OnboardPageModel(
      Color(0xFF005699),
      Color(0xFFFFE074),
      Color(0xFF39393A),
      2,
      'assets/images/onboard_2.png',
      'ENERGIZE',
      'YOURSELF',
      'Research shows that music can boost happiness and reduce anxiety. So get in to alievate your mood through music and fun yoga.'),
  OnboardPageModel(
      Color(0xFFFFE074),
      Color(0xFF39393A),
      Color(0xFFFFFFFF),
      0,
      'assets/images/onboard_3.png',
      'CONNECT WITH',
      'COUNSELLOR',
      'You might be going through a lot and need someone to talk to. Join in to connect and get temperamental assistance immediately'),
  OnboardPageModel(
      Color(0xFF39393A),
      Color(0xFFFFFFFF),
      Color(0xFF005699),
      1,
      'assets/images/onboard_4.png',
      'FRIEND',
      'IN DEED',
      'Sometimes you cannot share things with your friends but come on this platform and relieve your stress. We are your handy friend in deed.'),
];
