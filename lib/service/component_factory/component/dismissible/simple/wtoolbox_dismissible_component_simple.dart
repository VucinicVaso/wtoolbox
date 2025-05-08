import 'package:flutter/material.dart';
import '../wtoolbox_dismissible_component.dart';
import '../../wtoolbox_component_builder.dart';

class WTDismissibleComponentSimple extends WTDismissibleComponent {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey()!,
      builder: (context, constraints) {
        width    = constraints.maxWidth;
        iconSize = width! * 0.065;
        padding  = padding ?? const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
        margin   = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return Dismissible(
          key: getUniqueKey()!,
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            if(direction == DismissDirection.endToStart) { action!(); }
          },
          background: Container(
            width: width,
            padding: padding,
            margin: margin,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  swipeColorStart!,
                  swipeColorEnd!
                ],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Container(
              width: width,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
              child: WTComponentBuilder.createIcon(
                iconData: icon,
                color: iconColor,
                size: iconSize
              ),
            ),
          ),
          child: component == null
            ? WTComponentBuilder.emptyComponent()!
            : component!.runtimeType.toString() == 'Flexible'
              ? Row(children: <Widget>[ component! ])
              : component!,
        );
      }
    );
  }

}