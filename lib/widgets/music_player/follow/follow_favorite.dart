import 'package:flutter/material.dart';

class FollowFavoriteScreen extends StatefulWidget {
  const FollowFavoriteScreen({super.key});

  @override
  State<FollowFavoriteScreen> createState() => _FollowFavoriteScreenState();
}

class _FollowFavoriteScreenState extends State<FollowFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              Text(
                'This user\'s liked videos are private',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Century',
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
