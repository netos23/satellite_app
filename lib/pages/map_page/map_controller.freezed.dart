// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraUpdate {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraUpdateZoomIn value) zoomIn,
    required TResult Function(CameraUpdateZoomOut value) zoomOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraUpdateZoomIn value)? zoomIn,
    TResult? Function(CameraUpdateZoomOut value)? zoomOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraUpdateZoomIn value)? zoomIn,
    TResult Function(CameraUpdateZoomOut value)? zoomOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraUpdateCopyWith<$Res> {
  factory $CameraUpdateCopyWith(
          CameraUpdate value, $Res Function(CameraUpdate) then) =
      _$CameraUpdateCopyWithImpl<$Res, CameraUpdate>;
}

/// @nodoc
class _$CameraUpdateCopyWithImpl<$Res, $Val extends CameraUpdate>
    implements $CameraUpdateCopyWith<$Res> {
  _$CameraUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CameraUpdateZoomInImplCopyWith<$Res> {
  factory _$$CameraUpdateZoomInImplCopyWith(_$CameraUpdateZoomInImpl value,
          $Res Function(_$CameraUpdateZoomInImpl) then) =
      __$$CameraUpdateZoomInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraUpdateZoomInImplCopyWithImpl<$Res>
    extends _$CameraUpdateCopyWithImpl<$Res, _$CameraUpdateZoomInImpl>
    implements _$$CameraUpdateZoomInImplCopyWith<$Res> {
  __$$CameraUpdateZoomInImplCopyWithImpl(_$CameraUpdateZoomInImpl _value,
      $Res Function(_$CameraUpdateZoomInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CameraUpdateZoomInImpl implements CameraUpdateZoomIn {
  const _$CameraUpdateZoomInImpl();

  @override
  String toString() {
    return 'CameraUpdate.zoomIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CameraUpdateZoomInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
  }) {
    return zoomIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
  }) {
    return zoomIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomIn != null) {
      return zoomIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraUpdateZoomIn value) zoomIn,
    required TResult Function(CameraUpdateZoomOut value) zoomOut,
  }) {
    return zoomIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraUpdateZoomIn value)? zoomIn,
    TResult? Function(CameraUpdateZoomOut value)? zoomOut,
  }) {
    return zoomIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraUpdateZoomIn value)? zoomIn,
    TResult Function(CameraUpdateZoomOut value)? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomIn != null) {
      return zoomIn(this);
    }
    return orElse();
  }
}

abstract class CameraUpdateZoomIn implements CameraUpdate {
  const factory CameraUpdateZoomIn() = _$CameraUpdateZoomInImpl;
}

/// @nodoc
abstract class _$$CameraUpdateZoomOutImplCopyWith<$Res> {
  factory _$$CameraUpdateZoomOutImplCopyWith(_$CameraUpdateZoomOutImpl value,
          $Res Function(_$CameraUpdateZoomOutImpl) then) =
      __$$CameraUpdateZoomOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraUpdateZoomOutImplCopyWithImpl<$Res>
    extends _$CameraUpdateCopyWithImpl<$Res, _$CameraUpdateZoomOutImpl>
    implements _$$CameraUpdateZoomOutImplCopyWith<$Res> {
  __$$CameraUpdateZoomOutImplCopyWithImpl(_$CameraUpdateZoomOutImpl _value,
      $Res Function(_$CameraUpdateZoomOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CameraUpdateZoomOutImpl implements CameraUpdateZoomOut {
  const _$CameraUpdateZoomOutImpl();

  @override
  String toString() {
    return 'CameraUpdate.zoomOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraUpdateZoomOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
  }) {
    return zoomOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
  }) {
    return zoomOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomOut != null) {
      return zoomOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraUpdateZoomIn value) zoomIn,
    required TResult Function(CameraUpdateZoomOut value) zoomOut,
  }) {
    return zoomOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraUpdateZoomIn value)? zoomIn,
    TResult? Function(CameraUpdateZoomOut value)? zoomOut,
  }) {
    return zoomOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraUpdateZoomIn value)? zoomIn,
    TResult Function(CameraUpdateZoomOut value)? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomOut != null) {
      return zoomOut(this);
    }
    return orElse();
  }
}

abstract class CameraUpdateZoomOut implements CameraUpdate {
  const factory CameraUpdateZoomOut() = _$CameraUpdateZoomOutImpl;
}
