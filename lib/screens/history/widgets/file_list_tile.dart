import 'package:atsign_atmosphere_app/screens/common_widgets/custom_circle_avatar.dart';
import 'package:atsign_atmosphere_app/utils/colors.dart';
import 'package:atsign_atmosphere_app/utils/images.dart';
import 'package:atsign_atmosphere_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:atsign_atmosphere_app/services/size_config.dart';

class FilesListTile extends StatefulWidget {
  @override
  _FilesListTileState createState() => _FilesListTileState();
}

class _FilesListTileState extends State<FilesListTile> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CustomCircleAvatar(
            image: ImageConstants.test,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Levina Thomas',
                    style: CustomTextStyles.primaryRegular16,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 20.toHeight,
                      width: 20.toWidth,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.toHeight),
              Text(
                '@levinaTt',
                style: CustomTextStyles.secondaryRegular12,
              ),
              SizedBox(
                height: 8.toHeight,
              ),
              Container(
                width: 100.toWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '# Files',
                      style: CustomTextStyles.secondaryRegular12,
                    ),
                    Text(
                      '.',
                      style: CustomTextStyles.secondaryRegular12,
                    ),
                    Text(
                      '432 Kb',
                      style: CustomTextStyles.secondaryRegular12,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.toHeight,
              ),
              Container(
                width: 150.toWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'August 12 2020',
                      style: CustomTextStyles.secondaryRegular12,
                    ),
                    Container(
                      color: ColorConstants.fontSecondary,
                      height: 14.toHeight,
                      width: 1.toWidth,
                    ),
                    Text(
                      '1:22 PM',
                      style: CustomTextStyles.secondaryRegular12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.toHeight,
              ),
              (!isOpen)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      child: Container(
                        width: 140.toWidth,
                        child: Row(
                          children: [
                            Text(
                              'More Details',
                              style: CustomTextStyles.primaryBold14,
                            ),
                            Container(
                              width: 22.toWidth,
                              height: 22.toWidth,
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        (isOpen)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.toHeight,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        indent: 80.toWidth,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) => ListTile(
                        leading: Container(
                          height: 50.toHeight,
                          width: 50.toHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.toHeight),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                ImageConstants.test,
                              ),
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FILE_NAME',
                              style: CustomTextStyles.primaryRegular16,
                            ),
                            Container(
                              width: 80.toWidth,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '144 Kb',
                                    style: CustomTextStyles.secondaryRegular12,
                                  ),
                                  Text(
                                    '.',
                                    style: CustomTextStyles.secondaryRegular12,
                                  ),
                                  Text(
                                    'JPG',
                                    style: CustomTextStyles.secondaryRegular12,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: Container(
                      width: 140.toWidth,
                      margin: EdgeInsets.only(left: 85.toWidth),
                      child: Row(
                        children: [
                          Text(
                            'Lesser Details',
                            style: CustomTextStyles.primaryBold14,
                          ),
                          Container(
                            width: 22.toWidth,
                            height: 22.toWidth,
                            child: Center(
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}