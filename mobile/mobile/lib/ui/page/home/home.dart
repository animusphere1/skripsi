import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: RemoveScrollGlow(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: heightSize(context) * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: const [
                                Icon(Icons.search),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search....',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const Icon(
                            Icons.search,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const Icon(
                            Icons.search,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: heightSize(context) * 0.2,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 1),
                    itemBuilder: (context, index) {
                      return ContentWidget(
                        name: index.toString(),
                        onTap: <String>() async => 'ini data string' as String,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      ...List.generate(
                        4,
                        (index) => Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                index % 2 == 0 ? Colors.green : Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final String? name;
  final Future<T> Function<T>()? onTap;

  const ContentWidget({
    Key? key,
    this.name,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print('dia itu apa saja sih');
        print('dia itu apa saja sih');

        print('dia itu apa saja sih');

        print('dia itu apa saja sih');
        print('dia itu apa saja sih');

        print('dia itu apa saja sih');
        print('dia itu apa saja sih');
        print('dia itu apa saja sih');

        print('dia itu apa saja sih');
        print('dia itu apa saja sih');
        print('dia itu apa saja sih');

        print('dia itu apa saja sih');
        print('dia itu apa saja sih');

        print('apa saja ');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://picsum.photos/seed/picsum/200/300',
                  ),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black12.withOpacity(0.9),
                    Colors.black12.withOpacity(0.9),
                    Colors.black12.withOpacity(0.9),
                    Colors.black12.withOpacity(0.9),
                    Colors.black12.withOpacity(0.9),
                    Colors.black12.withOpacity(0.8),
                    Colors.black12.withOpacity(0.7),
                    Colors.black12.withOpacity(0.6),
                    Colors.black12.withOpacity(0.5),
                    Colors.black12.withOpacity(0.4),
                    Colors.black12.withOpacity(0.3),
                    Colors.black12.withOpacity(0.2),
                    Colors.black12.withOpacity(0.1),
                  ],
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Summer',
                        style: googleFontsNunito().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '23 ° Collection',
                        style: googleFontsNunito().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'FInd new brand collection',
                        style: googleFontsNunito().copyWith(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Booking Now',
                      style: googleFontsNunito().copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
