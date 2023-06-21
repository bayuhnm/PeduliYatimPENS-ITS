class DonationProgramModel {
  final int? id;
  final String? slug;
  final String? name;
  final String? photo;
  final String? programType;
  final String? description;
  final String? donateGoal;
  final String? currentDonateAmount;
  final String? donationCount;
  final String? endAt;
  final String? createdAt;
  final String? updatedAt;

  DonationProgramModel({
    this.id,
    this.slug,
    this.name,
    this.photo,
    this.programType,
    this.description,
    this.donateGoal,
    this.currentDonateAmount,
    this.donationCount,
    this.endAt,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to parse JSON data into a DonationProgram object
  factory DonationProgramModel.fromJson(Map<String, dynamic> json) =>
      DonationProgramModel(
        id: json['id'],
        slug: json['slug'],
        name: json['name'],
        photo: json['photo'],
        programType: json['program_type'],
        description: json['description'],
        donateGoal: json['donate_goal'],
        currentDonateAmount: json['current_donate_amount'],
        donationCount: json['donation_count'],
        endAt: json['end_at'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
