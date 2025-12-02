import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Exercitation do ad cillum sunt laborum Lorem. Sit nostrud consequat esse occaecat anim exercitation deserunt nisi reprehenderit aliqua commodo. Qui mollit elit ut nostrud non proident.',
      'assets/images/1.png'),
  SlideInfo(
      'Busca la comida',
      'Eiusmod id deserunt ut reprehenderit adipisicing cupidatat nostrud sit excepteur. Labore ullamco minim incididunt adipisicing mollit nostrud aliquip magna. Excepteur cillum cillum nisi magna velit cupidatat et aliquip Lorem aute. Aliquip pariatur dolore aliqua amet velit voluptate anim velit dolor ea sit occaecat. Non aliquip sint excepteur sit ut dolor incididunt anim esse mollit aute nisi. Pariatur ut eiusmod aliqua ad magna.',
      'assets/images/2.png'),
  SlideInfo(
      'Busca la comida',
      'Dolore amet cupidatat aliqua laboris aliquip amet adipisicing ullamco sunt. Excepteur ullamco cillum Lorem aliquip cillum officia non cupidatat. Ea in officia irure reprehenderit. Elit ex magna magna consectetur ut anim laborum excepteur ipsum nostrud voluptate.',
      'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;

      if(!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
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
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () => context.pop(), child: const Text('Salir')),
          ),


        endReached ?   Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                  onPressed: () => context.pop(), child: const Text('Comenzar')),
            ),
          ) :const  SizedBox(),
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
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: captionStyle,
          ),
        ],
      ),
    );
  }
}
