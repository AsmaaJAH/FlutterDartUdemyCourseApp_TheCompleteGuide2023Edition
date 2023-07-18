import 'package:course_app/section14_chatApp/widgets/chat_messages.dart';
import 'package:course_app/section14_chatApp/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _fireBase = FirebaseAuth.instance;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sky Chat'),
        actions: [
          IconButton(
            onPressed: () {
              _fireBase.signOut();
            },
            icon:  Icon(
              Icons.logout_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      body: const Column(children: [
        Expanded(child: ChatMessages(),),
        NewMessage(),
      ],),
      
    );
  }
}
