class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? paymentCategory;
  final String? logo;
  final String? createdAt;
  final String? updatedAt;

  PaymentMethodModel({
    this.id,
    this.name,
    this.paymentCategory,
    this.logo,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json['id'],
        name: json['name'],
        paymentCategory: json['payment_method_category_id'],
        logo: json['logo'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
}
