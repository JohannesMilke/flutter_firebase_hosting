import 'package:flutter/material.dart';

final double outerSpace = 40;
final borderRadiusOuter = BorderRadius.circular(12);
final borderRadiusInner = BorderRadius.circular(10);

class NewsletterSignupWidget extends StatefulWidget {
  @override
  _NewsletterSignupWidgetState createState() => _NewsletterSignupWidgetState();
}

class _NewsletterSignupWidgetState extends State<NewsletterSignupWidget> {
  final form = GlobalKey<FormState>();
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    final double sizeAvatar = 50;
    final double yAvatar = 10;
    final double topSpace = sizeAvatar - yAvatar;
    final top = -sizeAvatar - yAvatar;

    return Container(
      margin: EdgeInsets.only(top: 10 + sizeAvatar),
      constraints: BoxConstraints(maxWidth: 580),
      padding: EdgeInsets.all(10),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          ClipRRect(
            borderRadius: borderRadiusOuter,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(31, 40, 51, 1).withOpacity(0.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTop(topSpace: topSpace),
                  buildBottom(),
                ],
              ),
            ),
          ),
          Positioned(
            top: top,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: sizeAvatar,
              child: ClipOval(
                child: Image.asset(
                  'assets/user.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTop({
    @required double topSpace,
  }) =>
      Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          children: [
            SizedBox(height: topSpace),
            Text(
              'Sign Up for Flutter Newsletter',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'By Johannes Milke',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(text: 'You will receive information about '),
                  TextSpan(
                    text: 'Flutter & Firebase ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'and '),
                  TextSpan(
                    text: 'Personal News.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildBottom() => LayoutBuilder(
        builder: (context, constraints) {
          final double horizontal = constraints.maxWidth < 480 ? 16 : 36;

          return Container(
            padding: EdgeInsets.fromLTRB(horizontal, outerSpace, horizontal, 0),
            child: isSubscribed ? buildCompleted() : buildForm(context),
          );
        },
      );

  Widget buildCompleted() {
    final textColor = Color(0xFF0da865);
    final backgroundColor = Color(0xFF9fefcf);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadiusInner,
        border: Border.all(color: textColor, width: 3),
      ),
      child: Row(
        children: [
          Icon(Icons.done, color: textColor, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Success! Now check your email to confirm your subscription.',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForm(BuildContext context) => Form(
        key: form,
        child: Column(
          children: [
            TextFieldWidget(title: 'Your First Name'),
            const SizedBox(height: 20),
            TextFieldWidget(title: 'Your Email Address'),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: RaisedButton.icon(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                icon: Icon(Icons.mail_outline, color: Colors.white),
                label: Text(
                  'SUBSCRIBE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  setState(() => isSubscribed = true);
                },
              ),
            ),
            Container(
              height: outerSpace,
              child: Center(
                child: Text(
                  'I respect your privacy. Unsubscribe at any time.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      );
}

class TextFieldWidget extends StatelessWidget {
  final String title;

  const TextFieldWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;

    return TextFormField(
      style: TextStyle(color: color),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: color),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: borderRadiusInner,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2),
          borderRadius: borderRadiusInner,
        ),
      ),
    );
  }
}
