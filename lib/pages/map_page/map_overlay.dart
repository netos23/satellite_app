import 'package:flutter/cupertino.dart';

typedef OverlayEntryId = Object;
typedef OverlayEntryPredicate = bool Function(OverlayEntryId);

class MapOverlayController
    extends ValueNotifier<List<_MapOverlayEntryWrapper>> {
  final _overlayKey = GlobalKey<OverlayState>();

  OverlayState? get _state => _overlayKey.currentState;

  factory MapOverlayController([List<MapOverlayEntry> initial = const []]) {
    return MapOverlayController._(
      initial.map(_MapOverlayEntryWrapper.fromMapOverlayEntry).toList(),
    );
  }

  MapOverlayController._(super.value);

  void push(MapOverlayEntry entry) {
    final wrapper = _MapOverlayEntryWrapper.fromMapOverlayEntry(entry);
    value.add(wrapper);
    value = List.of(value);
    _state?.insert(wrapper.overlayEntry);
  }

  void replace(MapOverlayEntry entry) {}

  void pop() {
    final wrapper = value.removeLast();
    _remove(wrapper);
    value = List.of(value);
  }

  void popUntil(OverlayEntryPredicate predicate) {
    value.reversed.takeWhile(predicate).forEach(_remove);
    value = value.reversed.skipWhile(predicate).toList().reversed.toList();
  }

  void _remove(_MapOverlayEntryWrapper entry) {
    entry.overlayEntry.remove();
  }

  void hide(OverlayEntryId id) {
    final index = value.indexWhere((e) => e.mapOverlayEntry.id == id);

    if (index == -1) {
      return;
    }
    var wrapper = value[index];
    wrapper.mapOverlayEntry._disabled = true;
    wrapper.overlayEntry.markNeedsBuild();

    value = List.of(value);
  }

  void show(OverlayEntryId id) {
    final index = value.indexWhere((e) => e.mapOverlayEntry.id == id);

    if (index == -1) {
      return;
    }
    var wrapper = value[index];
    wrapper.mapOverlayEntry._disabled = false;
    wrapper.overlayEntry.markNeedsBuild();

    value = List.of(value);
  }
}

class _MapOverlayEntryWrapper {
  final OverlayEntry overlayEntry;
  final MapOverlayEntry mapOverlayEntry;

  static WidgetBuilder _createWidgetBuilder(MapOverlayEntry entry) {
    return (context) {
      if (entry._disabled) {
        return const SizedBox.shrink();
      }

      return entry.builder(context);
    };
  }

  factory _MapOverlayEntryWrapper.fromMapOverlayEntry(MapOverlayEntry entry) {
    final overlayEntry = OverlayEntry(builder: _createWidgetBuilder(entry));

    return _MapOverlayEntryWrapper(
      overlayEntry: overlayEntry,
      mapOverlayEntry: entry,
    );
  }

  _MapOverlayEntryWrapper({
    required this.overlayEntry,
    required this.mapOverlayEntry,
  });
}

class MapOverlayEntry {
  bool _disabled = false;

  final OverlayEntryId id;

  final WidgetBuilder builder;

  MapOverlayEntry({
    required this.id,
    required this.builder,
  });
}

class MapOverlay extends StatelessWidget {
  const MapOverlay({
    super.key,
    required this.map,
    required this.mapOverlayController,
  });

  final Widget map;
  final MapOverlayController mapOverlayController;

  @override
  Widget build(BuildContext context) {
    final entries = mapOverlayController.value;

    return Overlay(
      key: mapOverlayController._overlayKey,
      initialEntries: [
        OverlayEntry(builder: (_) => map),
        ...entries.map((e) => e.overlayEntry),
      ],
    );
  }
}
