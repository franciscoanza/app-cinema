import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  getLoadingMEssages() {
    final messages = <String>[
      'Cargando películas',
      '.',
      '..',
      '...',
      '....',
      '.....',
    ];
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) {
        return messages[step];
      },
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Esper'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMEssages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!.toString());
            },
          )
        ],
      ),
    );
  }
}
