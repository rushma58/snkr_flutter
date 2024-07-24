class PaymentVerificationResponseModel {
  final String pidx;
  final String transactionId;
  final String status;
  final int amount;
  final String productIdentity;
  final String productName;

  PaymentVerificationResponseModel({
    required this.pidx,
    required this.transactionId,
    required this.status,
    required this.amount,
    required this.productIdentity,
    required this.productName,
  });

  factory PaymentVerificationResponseModel.fromJson(Map<String, dynamic> map) {
    return PaymentVerificationResponseModel(
      pidx: map['pidx'],
      transactionId: map['transaction_id'],
      status: map['status'],
      amount: map['amount'],
      productIdentity: map['product_identity'],
      productName: map['product_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pidx': pidx,
      'transaction_id': transactionId,
      'status': status,
      'amount': amount,
      'product_identity': productIdentity,
      'product_name': productName,
    };
  }
}
