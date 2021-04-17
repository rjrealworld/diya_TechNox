import 'package:flutter/material.dart';
import 'package:diya/src/screens/agent/agent.dart';

void main() => runApp(Chatbot());

class Chatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Agent(title: 'Diya counsellor bot✨'),
    );
  }
}
