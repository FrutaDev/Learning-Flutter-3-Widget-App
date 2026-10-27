import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl
  });
}

final slides = <SlideInfo>[
  SlideInfo(title: "Busca la comida",
      caption: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dol",
      imageUrl: "assets/images/1.png"),
  SlideInfo(title: "Entrega rápida",
      caption: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dol",
      imageUrl: "assets/images/2.png"),
  SlideInfo(title: "Disfruta la comida",
      caption: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dol",
      imageUrl: "assets/images/3.png"),
];


class AppTutorialScreen extends StatefulWidget {
  static const String name = "app_tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReach = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReach && page >= (slides.length - 1.5)) {
        setState(() {
          endReach = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides.map(
                  (slideData) =>
                  _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
            )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () => context.pop(),
                child: Text("Salir")
            ),
          ),

          endReach ?
          Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 300),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: Text("Comenzar"),
                ),
              )
          ) : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    super.key,
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme
        .of(context)
        .textTheme
        .titleLarge;
    final captionStyle = Theme
        .of(context)
        .textTheme
        .bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            SizedBox(height: 10,),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),
    );
  }
}
