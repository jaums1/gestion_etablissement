
import 'package:flutter/cupertino.dart';

import 'curved_edges.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
               clipper:TCurvedEdges() ,
              child:child);
  }
}