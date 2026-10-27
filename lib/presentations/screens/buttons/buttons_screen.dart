import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botones"),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({super.key});


  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;

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
                onPressed: () {},
                child: const Text("Elevated")
            ),

            ElevatedButton(
                onPressed: null,
                child: const Text("Elevated disable")
            ),

            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_rounded),
                label: Text("Elevated icon")
            ),

            FilledButton(
                onPressed: () {},
                child: const Text("Filled")
            ),

            FilledButton.icon(
                onPressed: () {},
                icon: Icon(Icons.accessibility_new_outlined), label: Text("Filled Icon"),
            ),

            OutlinedButton(
                onPressed: () {},
                child: Text("Outlined")
            ),

            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.terminal),
                label: Text("Outlined")
            ),

            TextButton(
                onPressed: () {},
                child: Text("Text")
            ),

            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.text_decrease),
                label: Text("Text")
            ),

            IconButton(
                onPressed: () {},
                icon: Icon(Icons.app_registration_rounded)
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.app_registration_rounded),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(color.primary),
                  iconColor: WidgetStatePropertyAll(Colors.white),
                ),
            ),

            CustomButton()

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
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Hola botón",
                  style: TextStyle(color: Colors.white),
                )
            ),
          ),
      ),
    );
  }
}
