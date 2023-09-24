// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Bean extends Bean {
  @override
  final String roaster;
  @override
  final String name;
  @override
  final DateTime? roastDate;
  @override
  final BuiltMap<String, BeanSubdivision> subdivisions;

  factory _$Bean([void Function(BeanBuilder)? updates]) =>
      (new BeanBuilder()..update(updates))._build();

  _$Bean._(
      {required this.roaster,
      required this.name,
      this.roastDate,
      required this.subdivisions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(roaster, r'Bean', 'roaster');
    BuiltValueNullFieldError.checkNotNull(name, r'Bean', 'name');
    BuiltValueNullFieldError.checkNotNull(
        subdivisions, r'Bean', 'subdivisions');
  }

  @override
  Bean rebuild(void Function(BeanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BeanBuilder toBuilder() => new BeanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bean &&
        roaster == other.roaster &&
        name == other.name &&
        roastDate == other.roastDate &&
        subdivisions == other.subdivisions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, roaster.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, roastDate.hashCode);
    _$hash = $jc(_$hash, subdivisions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Bean')
          ..add('roaster', roaster)
          ..add('name', name)
          ..add('roastDate', roastDate)
          ..add('subdivisions', subdivisions))
        .toString();
  }
}

class BeanBuilder implements Builder<Bean, BeanBuilder> {
  _$Bean? _$v;

  String? _roaster;
  String? get roaster => _$this._roaster;
  set roaster(String? roaster) => _$this._roaster = roaster;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DateTime? _roastDate;
  DateTime? get roastDate => _$this._roastDate;
  set roastDate(DateTime? roastDate) => _$this._roastDate = roastDate;

  MapBuilder<String, BeanSubdivision>? _subdivisions;
  MapBuilder<String, BeanSubdivision> get subdivisions =>
      _$this._subdivisions ??= new MapBuilder<String, BeanSubdivision>();
  set subdivisions(MapBuilder<String, BeanSubdivision>? subdivisions) =>
      _$this._subdivisions = subdivisions;

  BeanBuilder();

  BeanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roaster = $v.roaster;
      _name = $v.name;
      _roastDate = $v.roastDate;
      _subdivisions = $v.subdivisions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Bean other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Bean;
  }

  @override
  void update(void Function(BeanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Bean build() => _build();

  _$Bean _build() {
    _$Bean _$result;
    try {
      _$result = _$v ??
          new _$Bean._(
              roaster: BuiltValueNullFieldError.checkNotNull(
                  roaster, r'Bean', 'roaster'),
              name:
                  BuiltValueNullFieldError.checkNotNull(name, r'Bean', 'name'),
              roastDate: roastDate,
              subdivisions: subdivisions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subdivisions';
        subdivisions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Bean', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BeanSubdivision extends BeanSubdivision {
  @override
  final int? weight;
  @override
  final int count;

  factory _$BeanSubdivision([void Function(BeanSubdivisionBuilder)? updates]) =>
      (new BeanSubdivisionBuilder()..update(updates))._build();

  _$BeanSubdivision._({this.weight, required this.count}) : super._() {
    BuiltValueNullFieldError.checkNotNull(count, r'BeanSubdivision', 'count');
  }

  @override
  BeanSubdivision rebuild(void Function(BeanSubdivisionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BeanSubdivisionBuilder toBuilder() =>
      new BeanSubdivisionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BeanSubdivision &&
        weight == other.weight &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BeanSubdivision')
          ..add('weight', weight)
          ..add('count', count))
        .toString();
  }
}

class BeanSubdivisionBuilder
    implements Builder<BeanSubdivision, BeanSubdivisionBuilder> {
  _$BeanSubdivision? _$v;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  BeanSubdivisionBuilder();

  BeanSubdivisionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weight = $v.weight;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BeanSubdivision other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BeanSubdivision;
  }

  @override
  void update(void Function(BeanSubdivisionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BeanSubdivision build() => _build();

  _$BeanSubdivision _build() {
    final _$result = _$v ??
        new _$BeanSubdivision._(
            weight: weight,
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'BeanSubdivision', 'count'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
