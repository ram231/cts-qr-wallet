import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main.dart';

class CtsLoginScaffold extends StatelessWidget {
  const CtsLoginScaffold();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.indigoAccent,
      body: CtsLoginBody(),
    );
  }
}

class CtsLoginBody extends StatelessWidget {
  const CtsLoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Spacer(),
        CtsLogo(),
        _CtsTitleText(),
        _CtsSubtitle(),
        Spacer(),
        CtsSignInOptions(),
        _Footer(),
      ],
    );
  }
}

class CtsLogo extends StatelessWidget {
  const CtsLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset(
          'assets/logo/logo.png',
          height: 128,
          width: 128,
        ),
      ),
    );
  }
}

class _CtsTitleText extends StatelessWidget {
  const _CtsTitleText();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'Contact Tracing QR Wallet',
      style: textTheme.headline4.copyWith(
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _CtsSubtitle extends StatelessWidget {
  const _CtsSubtitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'Your Contact Tracing QR Code storage',
      style: textTheme.caption.copyWith(
        fontStyle: FontStyle.italic,
        color: Colors.white70,
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Privacy Policy',
            style: textTheme.subtitle2.copyWith(
              decoration: TextDecoration.underline,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: Colors.white,
                icon: FaIcon(
                  FontAwesomeIcons.facebookF,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.white,
                icon: FaIcon(
                  FontAwesomeIcons.github,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.globe),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CtsLoginForm extends StatefulWidget {
  CtsLoginForm({
    Key key,
  }) : super(key: key);

  @override
  _CtsLoginFormState createState() => _CtsLoginFormState();
}

class _CtsLoginFormState extends State<CtsLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Password',
              ),
            ),
          ),
          CtsLoginButton(),
          Divider(
            color: Colors.black45,
            endIndent: 8,
            indent: 8,
          ),
          CtsSignInText(),
        ],
      ),
    );
  }
}

class CtsSignInOptions extends StatelessWidget {
  const CtsSignInOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            colorBrightness: Brightness.dark,
            onPressed: () {
              Navigator.pushNamed(context, routeDashboard);
            },
            color: Colors.red[400],
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}

class CtsSignInText extends StatelessWidget {
  const CtsSignInText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'SIGN IN WITH',
          style: textTheme.button,
        )
      ],
    );
  }
}

class CtsLoginButton extends StatelessWidget {
  const CtsLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(8),
        color: Colors.indigo,
        child: Text(
          'Login',
          style: textTheme.headline6.copyWith(
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
