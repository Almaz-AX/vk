import 'package:flutter/material.dart';

class Blank extends StatelessWidget {
  const Blank({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 35,), 
          Icon(Icons.note_alt_outlined, size: 50, color:Colors.grey[400] ,),
          const SizedBox(height: 15,),
          const Text('Создайте первую запись', style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),
          Text(textAlign: TextAlign.center, style: TextStyle(color:Colors.grey[400],),
                'Поделитесь с друзьями тем, что важно для вас', ),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (){}, child: const Text('Новая запись'))
          ],
        ),
    );
  }
}