import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TabBar(
                tabs: [
                  Container(
                    height: 20,
                    alignment: Alignment.center,
                    child: const Text(
                      'Browse',
                    ),
                  ),
                  Container(
                    height: 20,
                    alignment: Alignment.center,
                    child: const Text(
                      'Watch',
                    ),
                  ),
                ],
                labelPadding: const EdgeInsets.only(bottom: 5),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 25),
                indicatorWeight: 4,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        imageUrl:
                                            'https://picsum.photos/${800 + index}/${(index % 2 + 1) * 970}'),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://picsum.photos/${800 + index}/${(index % 2 + 1) * 970}',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => AspectRatio(
                                    aspectRatio:
                                        (800 + index) / ((index % 2 + 1) * 970),
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.more_horiz,
                                size: 20,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(FontAwesomeIcons.house),
                  Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Theme.of(context).primaryColor,
                  ),
                  Icon(
                    FontAwesomeIcons.plus,
                    color: Theme.of(context).primaryColor,
                  ),
                  Icon(
                    CupertinoIcons.chat_bubble_fill,
                    color: Theme.of(context).primaryColor,
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: const CachedNetworkImageProvider(
                        'https://picsum.photos/100'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
