import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app/constant/colorConst.dart';
import 'package:money_app/constant/textStyleConst.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 0,
          top: 0,
          left: 0,
          child: Container(
            height: 400,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
              color: ColorConst.primaryColor,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text('You can check your cards here.',
                    style: TextStyleConst.primaryTextStyle),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 350,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 10,
                  onPageChanged: (value) {
                    setState(() {
                      indexPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 20,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        border: indexPage != index
                            ? Border.all(color: Colors.black, width: .6)
                            : null,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        gradient: indexPage == index
                            ? const LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xffE100FF),
                                  Color(0xff40D3F2),
                                  Color(0xff2B47FC),
                                ],
                              )
                            : null,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 500),
                            style: TextStyleConst.primaryTextStyle.copyWith(
                              color: indexPage == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            child: const Text(
                              '\$4500.00',
                            ),
                          ),
                          AnimatedDefaultTextStyle(
                            style: TextStyleConst.primaryTextStyle.copyWith(
                              color: indexPage == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: const Text(
                              'Company',
                            ),
                          ),
                          const Spacer(),
                          AnimatedDefaultTextStyle(
                            style: TextStyleConst.primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: indexPage == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              DateTime.now().toIso8601String(),
                            ),
                          ),
                          AnimatedDefaultTextStyle(
                            style: TextStyleConst.primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: indexPage == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: const Text(
                              'Card Number',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Recent Transactions',
                  style: TextStyleConst.primaryTextStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(.4),
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      CupertinoIcons.bag,
                    ),
                  ),
                ),
                title: Text(
                  'data',
                  style: TextStyleConst.primaryTextStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Time',
                  style: TextStyleConst.primaryTextStyle.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                trailing: SizedBox(
                  width: 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '-',
                        style: TextStyleConst.primaryTextStyle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '\$120',
                        style: TextStyleConst.primaryTextStyle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.forward,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    ));
  }
}
