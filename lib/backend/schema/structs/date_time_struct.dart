// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateTimeStruct extends BaseStruct {
  DateTimeStruct({
    DateTime? createAt,
  }) : _createAt = createAt;

  // "createAt" field.
  DateTime? _createAt;
  DateTime? get createAt => _createAt;
  set createAt(DateTime? val) => _createAt = val;
  bool hasCreateAt() => _createAt != null;

  static DateTimeStruct fromMap(Map<String, dynamic> data) => DateTimeStruct(
        createAt: data['createAt'] as DateTime?,
      );

  static DateTimeStruct? maybeFromMap(dynamic data) =>
      data is Map ? DateTimeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'createAt': _createAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'createAt': serializeParam(
          _createAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DateTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateTimeStruct(
        createAt: deserializeParam(
          data['createAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DateTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DateTimeStruct && createAt == other.createAt;
  }

  @override
  int get hashCode => const ListEquality().hash([createAt]);
}

DateTimeStruct createDateTimeStruct({
  DateTime? createAt,
}) =>
    DateTimeStruct(
      createAt: createAt,
    );
