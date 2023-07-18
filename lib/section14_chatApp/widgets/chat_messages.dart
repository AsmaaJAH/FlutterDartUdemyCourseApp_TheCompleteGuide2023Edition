import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:course_app/section14_chatApp/widgets/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .orderBy(
              'createdTime',
              descending: false,
            )
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final loadedMessages = chatSnapshots.data!.docs;

          if (!chatSnapshots.hasData || loadedMessages.isEmpty) {
            return const Center(
              child: Text('No messages found yet! start adding some.'),
            );
          }
          if (chatSnapshots.hasError) {
            return const Center(
              child: Text('Something went wrong...'),
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 40,
                left: 15,
                right: 15,
              ),
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                final message = loadedMessages[index].data()['text'];
                final nextMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;
                final currentSender = message['userId'];
                final nextSender =
                    nextMessage != null ? nextMessage['userId'] : null;
                final nextUserIsSame = nextSender == currentSender;
                if (nextUserIsSame) {
                  return MessageBubble.next(
                    message: message['text'],
                    isMe: authenticatedUser.uid == currentSender,
                  );
                } else {
                  return MessageBubble.first(
                    userImage: message['userImage'],
                    username: message['username'],
                    message: message['text'],
                    isMe: authenticatedUser.uid == currentSender,
                  );
                }
              });
        });
  }
}
