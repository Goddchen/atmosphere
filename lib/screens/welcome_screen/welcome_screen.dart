import 'package:atsign_atmosphere_app/screens/common_widgets/app_bar.dart';
import 'package:atsign_atmosphere_app/screens/common_widgets/common_button.dart';
import 'package:atsign_atmosphere_app/screens/common_widgets/side_bar.dart';
import 'package:atsign_atmosphere_app/screens/welcome_screen/widgets/select_file_widget.dart';
import 'package:atsign_atmosphere_app/services/size_config.dart';
import 'package:atsign_atmosphere_app/utils/colors.dart';
import 'package:atsign_atmosphere_app/utils/images.dart';
import 'package:atsign_atmosphere_app/utils/text_strings.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/select_contact_widget.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isContactSelected;
  bool isFileSelected;
  void _showScaffold(String message) {
    Flushbar(
      title: message,
      message: "Lorem Ipsum is simply dummy ",
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: ColorConstants.scaffoldColor,
      boxShadows: [BoxShadow(color: Colors.black, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
      isDismissible: false,
      duration: Duration(seconds: 5),
      icon: Container(
        height: 40.toWidth,
        width: 40.toWidth,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageConstants.test), fit: BoxFit.cover),
          shape: BoxShape.circle,
        ),
      ),
      mainButton: FlatButton(
        onPressed: () {},
        child: Text(
          "Dismiss",
          style: TextStyle(color: ColorConstants.fontPrimary),
        ),
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Row(
        children: <Widget>[
          Icon(
            Icons.cancel,
            size: 13.toFont,
            color: ColorConstants.redText,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.toWidth,
            ),
            child: Text(
              message,
              style: TextStyle(color: ColorConstants.fadedText, fontSize: 10.toFont),
            ),
          )
        ],
      ),
      messageText: Text(
        "Levina Thomas 4 files, 12 MB",
        style: TextStyle(
          fontSize: 9.toFont,
          color: ColorConstants.fontSecondary,
        ),
      ),
    ).show(context);
  }

  @override
  void initState() {
    isContactSelected = false;
    isFileSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          showLeadingicon: true,
        ),
        endDrawer: SideBarWidget(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26.toWidth, vertical: 20.toHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextStrings().welcomeUser('John'),
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontSize: 28.toFont,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.toHeight,
                ),
                Text(
                  TextStrings().welcomeRecipient,
                  style: TextStyle(
                    color: ColorConstants.fadedText,
                    fontSize: 13.toFont,
                  ),
                ),
                SizedBox(
                  height: 67.toHeight,
                ),
                Text(
                  TextStrings().welcomeSendFilesTo,
                  style: TextStyle(
                    color: ColorConstants.fadedText,
                    fontSize: 12.toFont,
                  ),
                ),
                SizedBox(
                  height: 20.toHeight,
                ),
                SelectContactWidget(
                  (b) {
                    setState(() {
                      isContactSelected = b;
                    });
                  },
                ),
                SizedBox(
                  height: 40.toHeight,
                ),
                SelectFileWidget(
                  (b) {
                    setState(() {
                      isFileSelected = b;
                    });
                  },
                ),
                SizedBox(
                  height: 60.toHeight,
                ),
                if (isContactSelected && isFileSelected) ...[
                  Align(
                    alignment: Alignment.topRight,
                    child: CommonButton(
                      TextStrings().buttonSend,
                      () {
                        _showScaffold("Oops! something went wrong");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60.toHeight,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}