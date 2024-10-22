class SalesDataEntity {
  String year;
  int sales;

  SalesDataEntity({
    required this.year,
    required this.sales,
  });

  factory SalesDataEntity.fromJson(Map<String, dynamic> json) {
    return SalesDataEntity(
      year: json['year'],
      sales: json['sales'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['sales'] = sales;
    return data;
  }
}
