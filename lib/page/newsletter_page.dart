import 'package:flutter/material.dart';
import 'package:flutter_firebase_hosting/widget/newsletter_widget.dart';

class NewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: NewsletterSignupWidget(),
          ),
        ),
      );
}
