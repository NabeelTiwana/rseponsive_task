import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_task/constent/images.dart';
import 'package:responsive_task/responsive/responsive_helper.dart';
import 'package:responsive_task/responsive/responsive_text_style.dart';
import 'package:responsive_task/screens/widgets/my_appbar.dart';
import 'package:responsive_task/screens/widgets/my_banner.dart';
import 'package:responsive_task/screens/widgets/my_head_line.dart';
import 'package:responsive_task/screens/widgets/my_product.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xffefefe5),
          child: SingleChildScrollView(
            child: Padding(
              padding: context.allPadding,
              child: Column(
                children: [
                  const MyAppbar(),
                  SizedBox(height: context.smallSpacing),
                  const MyBanner(),
                  SizedBox(height: context.smallSpacing),
                  Center(
                    child: SizedBox(
                      width: ResponsiveHelper.getValue(
                        context,
                        mobile: 300,
                        tablet: 400,
                        desktop: 500,
                      ),
                      height: 50,
                      child: ListView.builder(
                        itemCount: MyImage.allLogos.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.symmetric(
                                horizontal: context.smallSpacing / 2,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  MyImage.allLogos[index],
                                  fit: BoxFit.contain,
                                  colorFilter: ColorFilter.mode(
                                    isSelected ? Colors.white : Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: context.mediumSpacing),
                  MyHeadings(),
                  SizedBox(height: context.smallSpacing),
                  MyProductContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





