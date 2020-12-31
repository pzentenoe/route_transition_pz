# route_transition

This package helps transitions between screens elegantly and easily

## Use Example

```
/// [context] is BuildContext Application in that moment
/// [child] is Widget to navigate
/// [animationType] is Animation Type
/// [duration] is animation Duration
/// [replacement] is replacement route
RouteTransitions(
  context: context,
  child: Page2Page(), 
  animationType: AnimationType.fadeIn, 
  duration: Duration(seconds: 2),
);
```
