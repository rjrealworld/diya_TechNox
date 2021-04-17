import 'package:flutter/material.dart';
import 'package:diya/src/screens/agent/widgets/message_composer.dart';
import 'package:diya/src/screens/agent/widgets/text_message.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class Agent extends StatefulWidget {
  final String title;

  Agent({ Key key, this.title }) : super(key: key);

 @override
  State<StatefulWidget> createState() => _AgentState();
}


class _AgentState extends State<Agent> {
  final List<TextMessage> _messages = <TextMessage>[];

  void _onQueryAgent(String query) async {
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/config/diya-fca98-1fd8dbb8bd07.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: 'es');
    AIResponse response = await dialogflow.detectIntent(query);

    TextMessage msg = new TextMessage(
      userName: "Diya Bot",
      message: response.getMessage() ?? new CardDialogflow(response.getListMessage()[0]).title,
      isMe: false,
    );

    setState(() { _messages.insert(0, msg); });
  }

  void onReceiveMessage(String message) {
    TextMessage msg = new TextMessage(userName: 'Me', message: message, isMe: true);

    setState(() { _messages.insert(0, msg); });
    _onQueryAgent(message);
  }

  void onNeedHelp() {
    print('Here...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(16.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            MessageComposer(onReceiveMessage, onNeedHelp),
          ],
        )
    );
  }
}
