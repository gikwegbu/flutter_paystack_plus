import 'package:flutter/material.dart';
import 'package:flutter_paystack_plus/src/abstract_class.dart';

import 'non_web_pay_compnt.dart';

class PayForMobile implements MakePlatformSpecificPayment {
  @override
  Future makePayment(
      {required String customerEmail,
      required String amount,
      required String reference,
      String? callBackUrl,
      String? publicKey,
      String? secretKey,
      String? currency,
      BuildContext? context,
      metadata,
      required void Function() onClosed,
      required void Function() onSuccess}) async {
    return await Navigator.push(
      context!,
      MaterialPageRoute(
          builder: (context) => PaystackPayNow(
                secretKey: secretKey!,
                email: customerEmail,
                reference: reference,
                currency: currency!,
                amount: amount,
                //paymentChannel: paymentChannel,
                metadata: metadata,
                transactionCompleted: onSuccess,
                transactionNotCompleted: onClosed,
                callbackUrl: callBackUrl ?? '',
              )),
    );
    // await PayWithPayStack().now(
    //   context: context!,
    //   secretKey: secretKey!,
    //   callbackUrl: callBackUrl ?? '',
    //   customerEmail: customerEmail,
    //   reference: reference,
    //   currency: currency!,
    //   amount: amount,
    //   transactionCompleted: onSuccess,
    //   transactionNotCompleted: onClosed,
    // );
  }
}

MakePlatformSpecificPayment makePlatformSpecificPayment() => PayForMobile();
