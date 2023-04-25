import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.2),
                              child: const Icon(
                                CupertinoIcons.chevron_back,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 330,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                  FontAwesomeIcons.xmark),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                'Options',
                                                style: GoogleFonts.notoSans(),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            'Follow ${Faker().internet.userName()}',
                                            style: GoogleFonts.notoSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Copy link',
                                            style: GoogleFonts.notoSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Download image',
                                            style: GoogleFonts.notoSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Hide Pin',
                                            style: GoogleFonts.notoSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Report Pin',
                                            style: GoogleFonts.notoSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "This goes against Pinterest's community guidelines",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              );
                            },
                            child: const Icon(
                              CupertinoIcons.ellipsis,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        child: const Icon(
                          CupertinoIcons.viewfinder,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 30,
              left: 18,
              right: 18,
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(CupertinoIcons.heart_circle_fill),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'View',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
