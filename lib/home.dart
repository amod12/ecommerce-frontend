import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  static const String id = '/home-screen';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('home'),
    );
  }
}
