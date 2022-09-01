import 'package:flutter/material.dart';

Widget? iconSelection(
  context,
  selection,
  VoidCallback? onTrue,
  VoidCallback? onNull,
  VoidCallback? onFalse,
) {
  switch (selection) {
    case true:
      return IconButton(
        onPressed: onTrue,
        icon: const Icon(Icons.cancel),
        color: Theme.of(context).colorScheme.primary,
      );
    case false:
      return IconButton(
        onPressed: onFalse,
        icon: const Icon(Icons.error),
        color: Theme.of(context).colorScheme.error,
      );
    case null:
    default:
      return IconButton(
        onPressed: onNull,
        icon: const Icon(Icons.error),
      );
  }
}

Widget? iconSelectionforPasswordField(
  context,
  selection,
  VoidCallback? onTrue,
  VoidCallback? onNull,
  VoidCallback? onFalse,
) {
  switch (selection) {
    case true:
      return IconButton(
        onPressed: onTrue,
        icon: const Icon(Icons.remove_red_eye),
        color: Theme.of(context).colorScheme.primary,
      );
    case false:
      return IconButton(
        onPressed: onFalse,
        icon: const Icon(Icons.error),
        color: Theme.of(context).colorScheme.error,
      );
    case null:
    default:
      return IconButton(
        onPressed: onNull,
        icon: const Icon(Icons.error),
      );
  }
}
