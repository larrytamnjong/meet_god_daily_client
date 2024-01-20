class Payment {
  int id;
  int? userId;
  String? txRef;
  int? amount;
  String? status;
  String? creationDate;
  String? completionDate;

  Payment(
      {required this.id,
      required this.userId,
      required this.txRef,
      required this.amount,
      required this.status,
      required this.creationDate,
      required this.completionDate});

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
        id: json['id'],
        userId: json['userId'],
        txRef: json['tx_ref'],
        amount: json['amount'],
        status: json['status'],
        creationDate: json['creation_date'],
        completionDate: json['completion_date']);
  }
}
