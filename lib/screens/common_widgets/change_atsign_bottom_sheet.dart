import 'dart:math';

import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:atsign_atmosphere_app/routes/route_names.dart';
import 'package:atsign_atmosphere_app/screens/welcome_screen/welcome_screen.dart';
import 'package:atsign_atmosphere_app/services/backend_service.dart';
import 'package:atsign_atmosphere_app/services/size_config.dart';
import 'package:atsign_atmosphere_app/utils/constants.dart';
import 'package:atsign_atmosphere_app/utils/text_styles.dart';
import 'package:atsign_atmosphere_app/view_models/contact_provider.dart';
import 'package:atsign_atmosphere_app/view_models/file_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AtSignBottomSheet extends StatefulWidget {
  final List<String> atSignList;
  AtSignBottomSheet({Key key, this.atSignList}) : super(key: key);

  @override
  _AtSignBottomSheetState createState() => _AtSignBottomSheetState();
}

class _AtSignBottomSheetState extends State<AtSignBottomSheet> {
  BackendService backendService = BackendService.getInstance();
  bool isLoading = false;
  var atClientPrefernce;
  @override
  Widget build(BuildContext context) {
    backendService
        .getAtClientPreference()
        .then((value) => atClientPrefernce = value);
    Random r = Random();
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: BottomSheet(
            onClosing: () {},
            backgroundColor: Colors.transparent,
            builder: (context) => ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Container(
                height: 100,
                width: SizeConfig().screenWidth,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.atSignList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: isLoading
                            ? () {}
                            : () async {
                                isLoading = true;

                                setState(() {});
                                var atClientPrefernce = await backendService
                                    .getAtClientPreference();
                                print(
                                    'here===atClientPrefernce===>${atClientPrefernce}');
                                await Onboarding(
                                  atsign: widget.atSignList[index],
                                  context: context,
                                  atClientPreference: atClientPrefernce,
                                  domain: MixedConstants.ROOT_DOMAIN,
                                  appColor: Color.fromARGB(255, 240, 94, 62),
                                  onboard: (value, atsign) async {
                                    await value[widget.atSignList[index]]
                                        .makeAtSignPrimary(
                                            widget.atSignList[index]);
                                    print(
                                        'VALUE===>${value[atsign].atClient}===atsign===>$atsign');
                                    await backendService.startMonitor(
                                        value: value, atsign: atsign);

                                    Provider.of<FilePickerProvider>(context,
                                            listen: false)
                                        .selectedFiles = [];

                                    Provider.of<ContactProvider>(context,
                                            listen: false)
                                        .resetContactImpl();
                                    isLoading = false;
                                    setState(() {});
                                    await Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.WELCOME_SCREEN,
                                        (Route<dynamic> route) => false);
                                  },
                                  onError: (error) {
                                    print('Onboarding throws $error error');
                                  },
                                  // nextScreen: WelcomeScreen(),
                                );
                                // }
                              },
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 20),
                          child: Column(
                            children: [
                              Container(
                                height: 40.toFont,
                                width: 40.toFont,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, r.nextInt(255),
                                      r.nextInt(255), r.nextInt(255)),
                                  borderRadius:
                                      BorderRadius.circular(50.toWidth),
                                ),
                                child: Center(
                                  child: Text(
                                    widget.atSignList[index]
                                        .substring(0, 2)
                                        .toUpperCase(),
                                    style: CustomTextStyles.whiteBold(
                                        size: (50 ~/ 3)),
                                  ),
                                ),
                              ),
                              Text(widget.atSignList[index])
                            ],
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Onboarding(
                          atsign: "",
                          context: context,
                          atClientPreference: atClientPrefernce,
                          domain: MixedConstants.ROOT_DOMAIN,
                          appColor: Color.fromARGB(255, 240, 94, 62),
                          onboard: (value, atsign) async {
                            backendService.atClientServiceMap = value;

                            String atSign = await backendService
                                .atClientServiceMap[atsign]
                                .atClient
                                .currentAtSign;

                            backendService.atSign = atSign;
                            await backendService.atClientServiceMap[atsign]
                                .makeAtSignPrimary(atSign);
                          },
                          onError: (error) {
                            print('Onboarding throws $error error');
                          },
                          nextScreen: WelcomeScreen(),
                        );

                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.add_circle_outline_outlined,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
