class FeeModel {
  final String companyId;
  final Map<dynamic, dynamic> govermentFeeInfo;
  final Map<dynamic, dynamic> serviceFeeInfo;

  FeeModel(
      {required this.companyId,
      required this.govermentFeeInfo,
      required this.serviceFeeInfo});

  factory FeeModel.fromJson(Map data) {
    return FeeModel(
      companyId: data['companyId'] ?? {},
      govermentFeeInfo: data['revenueCostInfo'] ?? {},
      serviceFeeInfo: data['serviceCostInfo'] ?? {},
    );
  }

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "revenueCostInfo": govermentFeeInfo,
        "serviceCostInfo": serviceFeeInfo,
      };
}
