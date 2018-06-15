import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.decelerate);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/bat_background.webp"),
            fit: BoxFit.fill,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white10,
                elevation: 8.0,
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: FlutterLogo(
                        colors: Colors.teal,
                        size: _iconAnimation.value * 128,
                      ),
                    ),
                    Form(
                      child: Column(
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(
                                top: 24.0,
                                bottom: 8.0,
                                left: 16.0,
                                right: 16.0),
                            child: TextField(
                              style: Theme.of(context).textTheme.body2,
                              decoration: InputDecoration(
                                labelStyle: Theme.of(context).textTheme.body2,
                                labelText: 'E-mail address',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 16.0,
                                left: 16.0,
                                right: 16.0),
                            child: TextField(
                              style: Theme.of(context).textTheme.body2,
                              decoration: InputDecoration(
                                labelStyle: Theme.of(context).textTheme.body2,
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                      child: OutlineButton(
                        onPressed: () {
                          print('I was tapped!');
                        },
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textTheme: ButtonTextTheme.normal,
                        child: Text('Log In'),
                        highlightedBorderColor: Colors.teal,
                        highlightColor: Colors.teal,
                        splashColor: Colors.teal,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
