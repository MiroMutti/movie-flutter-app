import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    required this.msg,
    // required this.loadingdKey,
  });

  final String msg;
  // final GlobalKey<ScaffoldState> loadingdKey;

  @override
  Widget build(BuildContext context) {
    // final AppLocalizations al = AppLocalizations.of(context)!;
    // Future<void>.delayed(
    //     Duration.zero,
    //     () => Loader.showLoadingDialog(context, loadingdKey,
    //         'The application will close in 3 seconds.', true));
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Icon(
                Icons.sentiment_very_satisfied,
                color: Theme.of(context).primaryColor,
                size: 120.0,
              ),
            ),
            Text(
              msg,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
