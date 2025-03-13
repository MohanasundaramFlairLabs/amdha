// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:razorpay_web/razorpay_web.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final bool _kAutoConsume = Platform.isIOS || true;
const String _kConsumableId = 'consumable';

class RazorPayWidget extends StatefulWidget {
  var description;

  RazorPayWidget(
      {super.key,
      this.width,
      this.height,
      required this.amount,
      required this.orderId,
      required this.name,
      required this.contact,
      required this.email,
      required this.reazorpayKey,
      required this.isEnabled,
      required this.backgroudColor,
      required this.successCallback,
      required this.onTapCallback,
      required this.errorCallback,
      required this.planId,
      required this.textColor});

  final double? width;
  final double? height;
  final int amount;
  final String orderId;
  final String name;
  final String reazorpayKey;
  final String contact;
  final String email;
  final bool isEnabled;
  final Color backgroudColor;
  final Future Function(String transactionId, String status, String planId)
      successCallback;
  final Future Function(String planId) onTapCallback;
  final Future Function(String status) errorCallback;
  final String planId;
  final Color textColor;
  @override
  State<RazorPayWidget> createState() => _RazorPayWidgetState();
}

class _RazorPayWidgetState extends State<RazorPayWidget> {
  late Razorpay _razorpay;

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String? _queryProductError;

  String defaultPlanId =
      '66c5db753d0325da603c90f9'; // String defaultPlanId = '66dad361c474065b28e1a02e';
  String iosPlanId =
      '66d94e86c484714adb222068'; //  String iosPlanId = '66d94e86c484714adb222068';
  String selectedPlanId = '';
  String tempOrderId = "";

  @override
  void didUpdateWidget(covariant RazorPayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.planId != widget.planId) {
      setState(() {
        print(widget.planId);
        if (widget.planId == defaultPlanId) {
          selectedPlanId = 'dev_66c5db753d0325da603c90f9';
        } else {
          selectedPlanId = widget.planId;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print(widget.planId);
    if (kIsWeb) {
      _razorpay = Razorpay();

      // Register event listeners
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    } else {
      if (widget.planId == defaultPlanId) {
        selectedPlanId = 'dev_66c5db753d0325da603c90f9';
      } else {
        selectedPlanId = widget.planId;
      }
      final Stream<List<PurchaseDetails>> purchaseUpdated =
          _inAppPurchase.purchaseStream;
      _subscription =
          purchaseUpdated.listen(_listenToPurchaseUpdated, onDone: () {
        _subscription.cancel();
      }, onError: (Object error) {
        print("Error on purchaseStream: ${error}");
      });

      initStoreInfo();
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle successful payment
    widget.successCallback('${response.paymentId}', 'success', widget.planId);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Payment Successful: ${response.paymentId}')),
    // );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    widget.errorCallback('${response.message}');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Payment Error: ${response.message}')),
    // );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet selection
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('External Wallet: ${response.walletName}')),
    );
  }

  void _openCheckout(String orderid) {
    var options = {
      'key': widget.reazorpayKey, // Replace with your actual API key
      'amount': widget.amount * 100, // Amount in paise
      'name': widget.name,
      'notes': {'order_id': orderid},
      'description': widget.description,
      'prefill': {
        'contact': widget.contact,
        'email': widget.email,
      },
    };
    print(options);
    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  // In app purchase

  Future<void> initStoreInfo() async {
    _isAvailable = await _inAppPurchase.isAvailable();
    if (!_isAvailable) {
      setState(() {
        _loading = false;
      });
      return;
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails({selectedPlanId});
    if (productDetailResponse.error != null) {
      print(productDetailResponse.error!.message);
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      print(productDetailResponse.productDetails.toString());
      setState(() {
        _loading = false;
      });
      return;
    }

    setState(() {
      _products = productDetailResponse.productDetails;
      _loading = false;
    });
  }

  void _buyConsumable(ProductDetails productDetails) {
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);
    _inAppPurchase.buyConsumable(
        purchaseParam: purchaseParam, autoConsume: _kAutoConsume);
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        setState(() {
          _purchasePending = true;
        });
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          _handlePurchaseError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          await _deliverProduct(purchaseDetails);
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> _deliverProduct(PurchaseDetails purchaseDetails) async {
    await ConsumableStore.save(purchaseDetails.purchaseID!);
    setState(() {
      _purchases.add(purchaseDetails);
      _purchasePending = false;
    });
    widget.successCallback(
        purchaseDetails.purchaseID!, 'success', widget.planId);
  }

  void _handlePurchaseError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
    widget.errorCallback('failed');
  }

  Future<void> buyProduct() async {
    if (widget.orderId != "") {
      if (kIsWeb) {
        _openCheckout(widget.orderId);
      } else {
        _buyConsumable(_products[0]);
      }
    } else {
      final orderResponse = await http.post(
          Uri.parse('${FFAppState().baseUrl}/activity/api/auth/payment/order'),
          headers: {
            'Authorization': 'Bearer ${FFAppState().userId}',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({'amount': widget.amount * 100}));

      final Map<String, dynamic> responseJson = jsonDecode(orderResponse.body);
      if (orderResponse.statusCode == 200) {
        if (kIsWeb) {
          _openCheckout(responseJson['id']);
        } else {
          widget.onTapCallback(widget.planId);
          _buyConsumable(_products[0]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isEnabled
          ? () async {
              // Call the buyProduct function when the button is pressed
              print(widget.planId);
              await buyProduct();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isEnabled
            ? widget.backgroudColor
            : Colors.grey, // Dynamic color
      ),
      child: Text('Join now',
          style: TextStyle(
            color: widget.textColor,
          )),
    );
  }
}

class ConsumableStore {
  static const String _kPrefKey = 'consumables';
  static Future<void> _writes = Future<void>.value();

  static Future<void> save(String id) {
    _writes = _writes.then((void _) => _doSave(id));
    return _writes;
  }

  static Future<List<String>> load() async {
    return (await SharedPreferences.getInstance()).getStringList(_kPrefKey) ??
        [];
  }

  static Future<void> _doSave(String id) async {
    final List<String> cached = await load();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    cached.add(id);
    await prefs.setStringList(_kPrefKey, cached);
  }
}
