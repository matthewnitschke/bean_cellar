import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'bean.sg.g.dart';

abstract class Bean implements Built<Bean, BeanBuilder> {
  String get roaster;
  String get name;
  DateTime? get roastDate;

  BuiltMap<String, BeanSubdivision> get subdivisions;

  factory Bean([void Function(BeanBuilder) updates]) = _$Bean;
  Bean._();
}

abstract class BeanSubdivision implements Built<BeanSubdivision, BeanSubdivisionBuilder> {
  int? get weight;
  int get count;

  factory BeanSubdivision([void Function(BeanSubdivisionBuilder) updates]) = _$BeanSubdivision;
  BeanSubdivision._();
}
