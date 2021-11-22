import 'package:flutter/widgets.dart';

Widget SXKeepAliveClientWrapper(Widget child) => _SXKeepAliveWidget(child);

class _SXKeepAliveWidget extends StatefulWidget {
  final Widget child;

  const _SXKeepAliveWidget(this.child);

  @override
  State<StatefulWidget> createState() => SXKeepAliveWidget();
}

class SXKeepAliveWidget extends State<_SXKeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
