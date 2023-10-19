class StockMarketScanData {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<CriteriaData> criteriaList;

  const StockMarketScanData(
      {required this.id,
      required this.name,
      required this.tag,
      required this.color,
      required this.criteriaList});

  factory StockMarketScanData.fromJson(Map<String, dynamic> json) {
    return StockMarketScanData(
        id: json['id'],
        name: json['name'],
        tag: json['tag'],
        color: json['color'],
        criteriaList: List.from(json['criteria']
            .map(((criteria) => CriteriaData.fromJson(criteria)))));
  }
}

class CriteriaData {
  final String type;
  final String text;
  final VariableData? variable;

  const CriteriaData({required this.type, required this.text, this.variable});

  factory CriteriaData.fromJson(Map<String, dynamic> json) {
    return CriteriaData(
        type: json['type'],
        text: json['text'],
        variable: json['variable'] != null
            ? VariableData.fromJson(json['variable'])
            : null);
  }
}

class VariableData {
  final VariableType? variable1;
  final VariableType? variable2;
  final VariableType? variable3;
  final VariableType? variable4;

  const VariableData(
      {this.variable1, this.variable2, this.variable3, this.variable4});

  factory VariableData.fromJson(Map<String, dynamic> json) {
    return VariableData(
      variable1:
          json['\$1'] != null ? VariableType.fromJson(json['\$1']) : null,
      variable2:
          json['\$2'] != null ? VariableType.fromJson(json['\$2']) : null,
      variable3:
          json['\$3'] != null ? VariableType.fromJson(json['\$3']) : null,
      variable4:
          json['\$4'] != null ? VariableType.fromJson(json['\$4']) : null,
    );
  }
}

class VariableType {
  final String type;
  final List<num>? values;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;

  const VariableType({
    required this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  factory VariableType.fromJson(Map<String, dynamic> json) {
    return VariableType(
      type: json['type'],
      values: json['values'] != null
          ? List.from(json['values'].map((element) => element as num))
          : null,
      studyType: json['study_type'],
      parameterName: json['parameter_name'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      defaultValue: json['default_value'],
    );
  }
}
