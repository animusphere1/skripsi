import 'package:midtrans_sdk/midtrans_sdk.dart';

class PaymentController {
  late MidtransSDK midtransSDK;

  static final PaymentController instance = PaymentController();

  Future<void> init() async {
    midtransSDK = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: 'SB-Mid-client-5vrRgeJQktXIXFaM',
        merchantBaseUrl: 'https://api.sandbox.midtrans.com',
        enableLog: true,
      ),
    );

    midtransSDK.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
      showPaymentStatus: true,
    );

    print('midtrans active');
  }

  Future<void> makePayment(String token) async {
    await midtransSDK.startPaymentUiFlow(token: token);
  }
}
