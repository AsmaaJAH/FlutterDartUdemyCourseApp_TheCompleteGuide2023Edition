import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:course_app/section14_chatApp/widgets/chat_messages.dart';
import 'package:course_app/section14_chatApp/widgets/new_message.dart';

final _fireBase = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fireMessaging = FirebaseMessaging.instance;
    await fireMessaging.requestPermission();
    // final addressToken = await fireMessaging.getToken();
    // debugPrint(addressToken.toString());
    fireMessaging.subscribeToTopic('chats');
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

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
            icon: Icon(
              Icons.logout_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
