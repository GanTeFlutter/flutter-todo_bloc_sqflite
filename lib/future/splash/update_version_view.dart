import 'package:flutter/material.dart';

class UpdateVersionView extends StatefulWidget {
  const UpdateVersionView({super.key});

  @override
  State<UpdateVersionView> createState() => _UpdateVersionViewState();
}

class _UpdateVersionViewState extends State<UpdateVersionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UpdateVersionView')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
        ),
      ),
    );
  }
}
