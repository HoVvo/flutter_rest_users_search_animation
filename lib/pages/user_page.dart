import 'package:flutter/material.dart';
import 'package:flutter_search_users/models/user_model.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Hero(
            tag: 'hero-${user.id}',
            child: SizedBox(
              height: 120,
              width: 120,
              child: CircleAvatar(
                child: Image.network(user.avatar),
                //backgroundImage: NetworkImage(user.avatar),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.email,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
