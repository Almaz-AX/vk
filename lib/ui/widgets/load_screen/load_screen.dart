import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'load_screen_model.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  static Widget create() {
    return Provider(create: (context) => LoadScreenModel(context), lazy: false,
    child: const LoadScreen(),);
  }
}
