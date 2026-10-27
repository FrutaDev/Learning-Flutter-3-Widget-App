import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static final String name = "snack_bar_screen";
  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Hola mundo"),
            action: SnackBarAction(label: "Ok", onPressed: () {}),
            duration: Duration(seconds: 2),
        )
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Are you sure?"),
          content: Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd guber"),
          actions: [
            TextButton(
                onPressed: () => context.pop(),
                child: Text("Cancelar")
            ),
            FilledButton(
                onPressed: () => context.pop(),
                child: Text("Aceptar")
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbars and Dialogs"),
      ),
      
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                    children: [
                      const Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in v")
                    ]
                  );
                },
                child: Text("Licencias usadas")
            ),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: Text("Mostrar diálogo")
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
            label: Text("Mostrar snackbar"),
            icon: Icon(Icons.remove_red_eye_outlined),
            onPressed: () => showCustomSnackBar(context),
      ),
    );
  }
}

// class  extends StatelessWidget {
//   const ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
