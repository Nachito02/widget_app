import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screnn'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated boton')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
              onPressed: null,
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated boton'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility_new),
              label: const Text('Filled icon'),
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),

            TextButton(onPressed: () {}, child: const Text('eskere')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_box_outlined),
              label: const Text('Text icon'),
            ),

            //Todo Custom button

            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child:const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Hola mundo',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
