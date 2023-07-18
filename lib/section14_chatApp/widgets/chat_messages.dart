import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemBuilder: (ctx, index) => Text(
              loadedMessages[index].data()['text'],
            ),
          );
        });
  }
}
