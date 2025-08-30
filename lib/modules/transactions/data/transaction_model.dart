import 'package:afrypay/modules/transactions/data/transaction_type.dart';

class Transactions {
  final String id;
  final String? title;
  final String? reference;
  final double amount;
  final double? fees;
  final double? commissionAmount;
  final String? description;
  final String? type;
  final String? status;
  final String? sens;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? payToken;
  final String? payIntent;
  final String? raisonReject;
  final String? card;
  final String? cashRegister;
  final String? paymentMethod;
  final String? createdBy;
  final String? updatedBy;
  final String? phone;

  Transactions({
    required this.id,
    this.title,
    this.reference,
    required this.amount,
    this.fees,
    this.commissionAmount,
    this.description,
    this.type,
    this.status,
    this.sens,
    this.isActive = true,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.payToken,
    this.payIntent,
    this.raisonReject,
    this.card,
    this.cashRegister,
    this.paymentMethod,
    this.createdBy,
    this.updatedBy,
  });

  factory Transactions.fromJson(final Map<String, dynamic> json) {
    return Transactions(
      id: json['id'],
      title: json['title'],
      reference: json['reference'],
      amount: double.tryParse(json['amount'].toString()) ?? 0.0,
      fees: json['fees'],
      commissionAmount: json['commission_amount'],
      description: json['description'],
      type: json['type'],
      status: json['status'],
      sens: json['sens'],
      isActive: json['is_active'] ?? true,
      phone: json['beneficiary'] is String ? json['beneficiary'] : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : DateTime.now(),
      cashRegister: json['cash_register'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'reference': reference,
      'amount': amount,
      'fees': fees,
      'commission_amount': commissionAmount,
      'description': description,
      'type': type,
      'status': status,
      'sens': sens,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pay_token': payToken,
      'pay_intent': payIntent,
      'raison_reject': raisonReject,
      'card': card,
      'cash_register': cashRegister,
      'payment_method': paymentMethod,
      'created_by': createdBy,
      'updated_by': updatedBy,
    };
  }

  bool get isIn => sens?.toLowerCase() == 'in';
  bool get isFailled =>
      status == TransactionStatus.unpaid ||
      status == TransactionStatus.rejected ||
      status == TransactionStatus.cancelled;
  bool get isPending =>
      status == TransactionStatus.pending ||
      status == TransactionStatus.created;

  String get image {
    switch (type) {
      case 'camwater':
        return 'assets/icons/water_icon.png';
      case 'eneo_postpay':
        return 'assets/icons/electric_icon.png';
      case 'deposit':
        return 'assets/icons/wallet.png';
      case 'cancel_deposit':
        return 'assets/icons/wallet.png';
      case 'withdrawal':
        return 'assets/icons/withdrwal.png';
      default:
        if (type?.contains("tontine") == true) {
          return "assets/icons/crowdfounding.png";
        }
        return 'assets/icons/wallet.png';
    }
  }
}

List<Transactions> transactionsListFacker = [
  Transactions(
    id: "tr_1",
    title: "Transaction 1",
    reference: "REF123",
    amount: 100.0,
    fees: 2.0,
    commissionAmount: 1.0,
    description: "Description 1",
    type: "bank_transfer",
    status: TransactionStatus.paid,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR123",
  ),
  Transactions(
    id: "trx_2",
    title: "Transaction 2",
    reference: "REF456",
    amount: 200.0,
    fees: 3.0,
    commissionAmount: 1.5,
    description: "Description 2",
    type: "mobile_money",
    status: TransactionStatus.pending,
    sens: "out",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR456",
  ),

  Transactions(
    id: "tr_3",
    title: "Transaction 3",
    reference: "REF789",
    amount: 300.0,
    fees: 4.0,
    commissionAmount: 2.0,
    description: "Description 3",
    type: "card_payment",
    status: TransactionStatus.failed,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR789",
  ),
  Transactions(
    id: "tr_4",
    title: "Transaction 4",
    reference: "REF101",
    amount: 400.0,
    fees: 5.0,
    commissionAmount: 2.5,
    description: "Description 4",
    type: "cash",
    status: TransactionStatus.cancelled,
    sens: "out",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR101",
  ),
  Transactions(
    id: "tr_5",
    title: "Transaction 5",
    reference: "REF202",
    amount: 500.0,
    fees: 6.0,
    commissionAmount: 3.0,
    description: "Description 5",
    type: "cheque",
    status: TransactionStatus.pending,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR202",
  ),
  Transactions(
    id: "tr_1",
    title: "Transaction 1",
    reference: "REF123",
    amount: 100.0,
    fees: 2.0,
    commissionAmount: 1.0,
    description: "Description 1",
    type: "bank_transfer",
    status: TransactionStatus.paid,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR123",
  ),
  Transactions(
    id: "trx_2",
    title: "Transaction 2",
    reference: "REF456",
    amount: 200.0,
    fees: 3.0,
    commissionAmount: 1.5,
    description: "Description 2",
    type: "mobile_money",
    status: TransactionStatus.pending,
    sens: "out",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR456",
  ),

  Transactions(
    id: "tr_3",
    title: "Transaction 3",
    reference: "REF789",
    amount: 300.0,
    fees: 4.0,
    commissionAmount: 2.0,
    description: "Description 3",
    type: "card_payment",
    status: TransactionStatus.failed,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR789",
  ),
  Transactions(
    id: "tr_4",
    title: "Transaction 4",
    reference: "REF101",
    amount: 400.0,
    fees: 5.0,
    commissionAmount: 2.5,
    description: "Description 4",
    type: "cash",
    status: TransactionStatus.cancelled,
    sens: "out",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR101",
  ),
  Transactions(
    id: "tr_5",
    title: "Transaction 5",
    reference: "REF202",
    amount: 500.0,
    fees: 6.0,
    commissionAmount: 3.0,
    description: "Description 5",
    type: "cheque",
    status: TransactionStatus.pending,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR202",
  ),
  Transactions(
    id: "tr_1",
    title: "Transaction 1",
    reference: "REF123",
    amount: 100.0,
    fees: 2.0,
    commissionAmount: 1.0,
    description: "Description 1",
    type: "bank_transfer",
    status: TransactionStatus.paid,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR123",
  ),
  Transactions(
    id: "trx_2",
    title: "Transaction 2",
    reference: "REF456",
    amount: 200.0,
    fees: 3.0,
    commissionAmount: 1.5,
    description: "Description 2",
    type: "mobile_money",
    status: TransactionStatus.pending,
    sens: "out",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR456",
  ),

  Transactions(
    id: "tr_3",
    title: "Transaction 3",
    reference: "REF789",
    amount: 300.0,
    fees: 4.0,
    commissionAmount: 2.0,
    description: "Description 3",
    type: "card_payment",
    status: TransactionStatus.failed,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR789",
  ),
  Transactions(
    id: "tr_4",
    title: "Transaction 4",
    reference: "REF101",
    amount: 400.0,
    fees: 5.0,
    commissionAmount: 2.5,
    description: "Description 4",
    type: "cash",
    status: TransactionStatus.cancelled,
    sens: "out",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR101",
  ),
  Transactions(
    id: "tr_5",
    title: "Transaction 5",
    reference: "REF202",
    amount: 500.0,
    fees: 6.0,
    commissionAmount: 3.0,
    description: "Description 5",
    type: "cheque",
    status: TransactionStatus.pending,
    sens: "in",
    isActive: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cashRegister: "CR202",
  ),
];
