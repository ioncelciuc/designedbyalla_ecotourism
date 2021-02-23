import 'package:flutter/material.dart';

class Adventure extends StatefulWidget {
  @override
  _AdventureState createState() => _AdventureState();
}

class _AdventureState extends State<Adventure>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text('Adventure'),
    );
  }
}
