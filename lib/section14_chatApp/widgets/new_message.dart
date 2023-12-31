import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _firebaseFirestore = FirebaseFirestore.instance;

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() {
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage> {
  final _newMessageController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _newMessageController.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _newMessageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    _newMessageController.clear();
    final currentUser = _firebaseAuth.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    _firebaseFirestore.collection('chats').add({
      'text': enteredMessage,
      'createdTime': Timestamp.now(),
      'userId': currentUser.uid,
      'username': userData.data()!['username'],
      'userImage': userData.data()!['imageURL'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _newMessageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(labelText: 'Send a message...'),
            ),
          ),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(
              Icons.send,
            ),
            onPressed: _submitMessage,
          ),
        ],
      ),
    );
  }
}
