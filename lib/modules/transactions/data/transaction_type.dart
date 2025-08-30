import 'package:afrypay/common/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class TransactionType {
  static const String bankTransfer = 'bank_transfer';
  static const String mobileMoney = 'mobile_money';
  static const String cardPayment = 'card_payment';
  static const String cash = 'cash';
  static const String cheque = 'cheque';
  static const String other = 'other';
  static const String deposit = 'deposit';
  static const String cancelDeposit = 'cancel_deposit';
  static const String withdrawal = 'withdrawal';
  static const String cancelWithdrawal = 'cancel_withdrawal';
  static const String transfer = 'transfer';
  static const String payment = 'payment';
  static const String paymentService = 'payment_service';
  static const String refund = 'refund';
  static const String loanRefund = 'loan_repayment';
  static const String savings = 'savings';
  static const String loan = 'loan';
  static const String canalPlus = 'canal_plus';
  static const String mtnTopUp = 'mtn_top_up';
  static const String orangeTopUp = 'orange_top_up';
  static const String mtnData = 'mtn_data';
  static const String orangeData = 'orange_data';
  static const String sponsorship = 'sponsorship';
  static const String shopping = 'shopping';
  static const String tontines = 'tontine_payment';
  static const String securityDeposit = 'security_deposit';
  static const String loanDistribution = 'loan_distribution';
  static const String eneoPostPay = 'eneo_postpay';
  static const String canwater = 'camwater';
  static const String initDeposit = 'init_deposit';
  static const String tontinesubscription = 'tontine_subscription';
  static const String tontinePayment = 'tontine_subscription';
  static const String neeroCardDeposit = 'neero_card_deposit';
  static const String neeroCardWithdrawal = 'neero_card_withdrawal';

  static String interpret(String type) {
    switch (type) {
      case neeroCardDeposit:
        return "Recharge de la carte";
      case neeroCardWithdrawal:
        return "Retrait de la carte";
      case bankTransfer:
        return 'Virement bancaire'.tr;
      case securityDeposit:
        return 'Caution du prêt'.tr;
      case loanDistribution:
        return 'Prêt rapide'.tr;
      case mobileMoney:
        return 'Virement mobile'.tr;
      case cardPayment:
        return 'Paiement avec carte'.tr;
      case cash:
        return 'Paiement en espèces'.tr;
      case cheque:
        return 'Chèque'.tr;
      case other:
        return 'Autres'.tr;
      case deposit:
        return 'Dépôt'.tr;
      case cancelDeposit:
        return 'Annulation de dépôt'.tr;
      case withdrawal:
        return 'Retrait'.tr;
      case cancelWithdrawal:
        return 'Annulation de retrait'.tr;
      case transfer:
        return 'Transfert'.tr;
      case payment:
        return 'Paiement'.tr;
      case paymentService:
        return 'Paiement service'.tr;
      case refund:
        return 'Remboursement'.tr;
      case savings:
        return 'Épargne'.tr;
      case loan:
        return 'Prêt'.tr;
      case canalPlus:
        return 'Canal+'.tr;
      case mtnTopUp:
        return 'Recharge Mtn'.tr;
      case orangeTopUp:
        return 'Recharge Orange'.tr;
      case mtnData:
        return 'Données mobile Mtn'.tr;
      case orangeData:
        return 'Données mobile Orange'.tr;
      case sponsorship:
        return 'Parrainage'.tr;
      case loanRefund:
        return 'Remboursement de prêt'.tr;
      case eneoPostPay:
        return 'Facture Eneo'.tr;
      case "top_up":
        return 'Achat de crédit'.tr;
      case canwater:
        return 'Facture Canwater'.tr;
      case initDeposit:
        return 'Dépôt initial'.tr;
      case tontinesubscription:
        return 'Création de tontine'.tr;
      case tontines:
        return 'Paiement de la tontine'.tr;
      default:
        return type.capitalizeFirst ?? type;
    }
  }
}

class TransactionStatus {
  static const String created = "created";
  static const String paid = "paid";
  static const String succes = "success";
  static const String pending = "pending";
  static const String unpaid = "unpaid";
  static const String cancelled = "canceled";
  static const String failed = "failed";
  static const String refunded = "refunded";
  static const String approved = "approved";
  static const String rejected = "rejected";
}

String statuInterpret(String status) {
  switch (status.toLowerCase()) {
    case TransactionStatus.created:
      return 'Créé'.tr;
    case TransactionStatus.paid:
      return 'Payée'.tr;
    case TransactionStatus.succes:
      return 'Réussite'.tr;
    case TransactionStatus.pending:
      return 'En attente'.tr;
    case TransactionStatus.unpaid:
      return 'Non payé'.tr;
    case TransactionStatus.cancelled:
      return 'Annulé'.tr;
    case TransactionStatus.failed:
      return 'Échoué'.tr;
    case TransactionStatus.refunded:
      return 'Remboursé'.tr;
    case TransactionStatus.approved:
      return 'Approuvé'.tr;
    case TransactionStatus.rejected:
      return 'Rejeté'.tr;
    default:
      return status;
  }
}

Color transactionColor(String status) {
  switch (status.toLowerCase()) {
    case TransactionStatus.created:
      return Colors.deepOrange;
    case TransactionStatus.paid || TransactionStatus.succes:
      return primaryColors;
    case TransactionStatus.pending:
      return Colors.deepOrange;
    case TransactionStatus.unpaid:
      return redColors;
    case TransactionStatus.cancelled:
      return redColors;
    case TransactionStatus.failed:
      return redColors;
    case TransactionStatus.refunded:
      return primaryColors;
    case TransactionStatus.approved:
      return primaryColors;
    case TransactionStatus.rejected:
      return redColors;
    default:
      return redColors;
  }
}
