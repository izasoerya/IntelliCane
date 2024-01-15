import 'package:flutter/material.dart';

class User {
  final String name;
  final String imageUrl;

  User({required this.name, required this.imageUrl});
}

class MessagePage extends StatelessWidget {
  final List<User> users = [
    User(name: 'Alice', imageUrl: 'assets/alice.jpg'),
    User(name: 'Bob', imageUrl: 'assets/bob.jpg'),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.group),
            onPressed: () {
              // Handle create group action
              // Navigate to group creation page
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle broadcast message action
              // Show a dialog or navigate to broadcast page
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.imageUrl),
            ),
            title: Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Last message from ${user.name}'),
            onTap: () {
              // Handle user selection
              // Navigate to chat screen for this user
            },
          );
        },
      ),
    );
  }
}
