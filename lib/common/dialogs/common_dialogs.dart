
import 'package:flutter/material.dart';


// This class defines all the common dialogs used in the app.
Future<void> showCommonAlertSingleButtonDialog(
    {required String title,
      required String subHeader,
      Function()? okPressed}) async {

   showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if(okPressed != null) okPressed();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(subHeader),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
