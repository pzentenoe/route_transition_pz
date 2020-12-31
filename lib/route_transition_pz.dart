import 'package:flutter/material.dart';

/// Animation Types
enum AnimationType { normal, fadeIn }

/// Main Class,
/// [context] is BuildContext Application in that moment
/// [child] is Widget to navigate
/// [animationType] is Animation Type
/// [duration] is animation Duration
/// [replacement] is replacement route
class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animationType;
  final Duration duration;
  final bool replacement;

  RouteTransitions({
    @required this.context,
    @required this.child,
    this.animationType = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
    this.replacement = false,
  }) {
    switch (animationType) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      default:
        _normalTransition();
    }
  }

  /// Normal push to page
  void _pushPage(Route route) => Navigator.push(context, route);

  /// Push replacement to new page
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  /// Normal transition method
  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => child);
    if (replacement) {
      _pushReplacementPage(route);
    } else {
      _pushPage(route);
    }
  }

  /// Transition with fadeIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, ___) {
          return FadeTransition(
            child: child,
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
          );
        });

    if (replacement) {
      _pushReplacementPage(route);
    } else {
      _pushPage(route);
    }
  }
}
