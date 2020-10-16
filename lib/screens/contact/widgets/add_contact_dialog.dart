import 'package:atsign_atmosphere_app/screens/common_widgets/custom_button.dart';

/// This widgets pops up when a contact is added it takes [name]
/// [handle] to display the name and the handle of the user and an
/// onTap function named as [onYesTap] for on press of [Yes] button of the dialog
import 'package:atsign_atmosphere_app/services/size_config.dart';
import 'package:atsign_atmosphere_app/services/validators.dart';
import 'package:atsign_atmosphere_app/utils/text_strings.dart';
import 'package:atsign_atmosphere_app/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddContactDialog extends StatelessWidget {
  final String name;
  final String handle;
  final Function() onYesTap;
  final formKey;

  AddContactDialog({
    Key key,
    this.name,
    this.handle,
    this.onYesTap,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        child: SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.toWidth)),
            titlePadding: EdgeInsets.only(top: 20.toHeight, left: 25.toWidth, right: 25.toWidth),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    TextStrings().addContactHeading,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.primaryBold18,
                  ),
                )
              ],
            ),
            content: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 198.toHeight),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.toHeight,
                  ),
                  TextFormField(
                    autofocus: true,
                    validator: Validators.validateAdduser,
                    decoration: InputDecoration(
                      prefixText: '@',
                      prefixStyle: TextStyle(color: Colors.grey),
                      hintText: '\tEnter user atsign',
                    ),
                  ),
                  SizedBox(
                    height: 45.toHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        buttonText: TextStrings().addtoContact,
                        onPressed: onYesTap,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
