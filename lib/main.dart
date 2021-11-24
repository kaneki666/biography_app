import 'package:biography/imagemodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Biography',
      debugShowCheckedModeBanner: false,
      home: BioGraphy(),
    );
  }
}

class BioGraphy extends StatefulWidget {
  const BioGraphy({Key? key}) : super(key: key);

  @override
  _BioGraphyState createState() => _BioGraphyState();
}

class _BioGraphyState extends State<BioGraphy>
    with SingleTickerProviderStateMixin {
  bool show1 = false;
  bool show2 = false;
  bool show3 = false;
  bool show4 = false;
  bool showContainer1 = false;
  late AnimationController _controller;

  late final Animation<double> translateX = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.65,
        1,
        curve: Curves.easeIn,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        showContainer1 = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 200,
            floating: true,
            pinned: false,
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return Future<void>.value();
            },
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              titlePadding: EdgeInsets.zero,
              background: CachedNetworkImage(
                imageUrl:
                    'https://www.hillaryclinton.com/wp-content/uploads/2016/06/hillary-clinton-topper.jpg',
                fit: BoxFit.cover,
              ),
              title:
                  const Text("Welcome to the Office of Hillary Rodham Clinton"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: showContainer1 ? 1 : 0,
                    child: const Text(
                      "Read about Hillary's life",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.4,
                      ),
                    ),
                    secondChild: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.4,
                      ),
                    ),
                    crossFadeState: !show1
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: showContainer1 ? 1 : 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            show1 = !show1;
                          });
                        },
                        child: Text(
                          !show1 ? "Read More" : "Read less",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: showContainer1 ? 1 : 0,
                    child: const Text(
                      "Read about Hillary's life",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.4,
                      ),
                    ),
                    secondChild: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.4,
                      ),
                    ),
                    crossFadeState: !show2
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: showContainer1 ? 1 : 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            show2 = !show2;
                          });
                        },
                        child: Text(
                          !show2 ? "Read More" : "Read less",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: showContainer1 ? 1 : 0,
                    child: const Text(
                      "Read about Hillary's life",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.4,
                      ),
                    ),
                    secondChild: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.4,
                      ),
                    ),
                    crossFadeState: !show3
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: showContainer1 ? 1 : 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            show3 = !show3;
                          });
                        },
                        child: Text(
                          !show3 ? "Read More" : "Read less",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Media",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SliverStaggeredGrid.countBuilder(
            crossAxisCount: 4,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  barrierColor: Colors.black.withOpacity(0.8),
                  context: context,
                  builder: (BuildContext context) {
                    return ImageViewModal(
                      image: images[index],
                    );
                  },
                )
              },
              child: CachedNetworkImage(
                imageUrl: images[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.greenAccent,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
          )
        ],
      ),
    );
  }
}

// class BioGraphy extends StatefulWidget {
//   const BioGraphy({Key? key}) : super(key: key);

//   @override
//   _BioGraphyState createState() => _BioGraphyState();
// }

// class _BioGraphyState extends State<BioGraphy> {
//   bool show1 = false;
//   bool show2 = false;
//   bool show3 = false;
//   bool show4 = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Read about Hillary's life",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//               maxLines: show1 ? 100 : 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 12,
//                 letterSpacing: 1.4,
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     show1 = !show1;
//                   });
//                 },
//                 child: Text(
//                   !show1 ? "Read More" : "Read less",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               "Read about Hillary's life",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//               maxLines: show2 ? 100 : 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 12,
//                 letterSpacing: 1.4,
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     show2 = !show2;
//                   });
//                 },
//                 child: Text(
//                   !show2 ? "Read More" : "Read less",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               "Read about Hillary's life",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//               maxLines: show3 ? 100 : 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 12,
//                 letterSpacing: 1.4,
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     show3 = !show3;
//                   });
//                 },
//                 child: Text(
//                   !show3 ? "Read More" : "Read less",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               "Read about Hillary's life",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//               maxLines: show4 ? 100 : 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 12,
//                 letterSpacing: 1.4,
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     show4 = !show4;
//                   });
//                 },
//                 child: Text(
//                   !show4 ? "Read More" : "Read less",
//                 ),
//               ),
//             ),
//             const Text(
//               "Media",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             StaggeredGridView.countBuilder(
//               padding: EdgeInsets.zero,
//               crossAxisCount: 4,
//               itemCount: images.length,
//               itemBuilder: (BuildContext context, int index) =>
//                   GestureDetector(
//                 onTap: () => {
//                   showModalBottomSheet<void>(
//                     isScrollControlled: true,
//                     barrierColor: Colors.black.withOpacity(0.8),
//                     context: context,
//                     builder: (BuildContext context) {
//                       return ImageViewModal(
//                         image: images[index],
//                       );
//                     },
//                   )
//                 },
//                 child: CachedNetworkImage(
//                   imageUrl: images[index],
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) => const Center(
//                       child: CircularProgressIndicator(
//                     color: Colors.greenAccent,
//                   )),
//                   errorWidget: (context, url, error) =>
//                       const Icon(Icons.error),
//                 ),
//               ),
//               staggeredTileBuilder: (int index) =>
//                   StaggeredTile.count(2, index.isEven ? 2 : 1),
//               mainAxisSpacing: 2.0,
//               crossAxisSpacing: 2.0,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Example04 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('customScrollView'),
//         ),
//         body: CustomScrollView(
//           primary: false,
//           slivers: <Widget>[
//             Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//           ],
//         ),
//           ],
//         ));
//   }
// }

List<String> images = [
  "https://images.pexels.com/photos/5737578/pexels-photo-5737578.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  'https://images.pexels.com/photos/5737367/pexels-photo-5737367.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5737373/pexels-photo-5737373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5848700/pexels-photo-5848700.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5737369/pexels-photo-5737369.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5848705/pexels-photo-5848705.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5737373/pexels-photo-5737373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];
