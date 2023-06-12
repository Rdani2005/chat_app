import 'dart:io';

import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final messages = <ChatMessage>[];

  bool isWriting = false;

  @override
  void dispose() {
    // TODO: Socket off.
    for (ChatMessage message in messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            maxRadius: 12,
            child: const Text(
              "DS",
              style: TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "User Name",
            style: TextStyle(color: Colors.black87, fontSize: 10),
          )
        ]),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (_, i) => messages[i],
                reverse: true,
              ),
            ),
            const Divider(
              height: 1,
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: (_) {},
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                  isWriting = true;
                } else {
                  isWriting = false;
                }

                setState(() {});
              },
              decoration:
                  const InputDecoration.collapsed(hintText: 'Send message'),
              focusNode: _focusNode,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isIOS
                ? CupertinoButton(
                    onPressed: !isWriting
                        ? null
                        : () => _handleSubmit(_textController.text.trim()),
                    child: const Text("Send"),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          Icons.send,
                        ),
                        onPressed: !isWriting
                            ? null
                            : () => _handleSubmit(_textController.text.trim()),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    ));
  }

  _handleSubmit(String text) {
    if (text.isEmpty) return;
    final newMessage = ChatMessage(
      text: text,
      id: "123",
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
      ),
    );
    messages.insert(0, newMessage);
    newMessage.animationController.forward();
    _textController.clear();
    _focusNode.requestFocus();
    isWriting = false;

    setState(() {});
  }
}
