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

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:flutter/cupertino.dart';

final bool _kAutoConsume = Platform.isIOS || true;
const String _kConsumableId = 'consumable';

class InAppPurchaseWidget extends StatefulWidget {
  const InAppPurchaseWidget(
      {super.key,
      this.width,
      this.height,
      required this.productIds,
      required this.successCallback,
      required this.failureCallback});

  final double? width;
  final double? height;
  final List<String> productIds;
  final Future Function(String planId, String purchaseId) successCallback;
  final Future Function() failureCallback;
  @override
  State<InAppPurchaseWidget> createState() => _InAppPurchaseWidgetState();
}

class _InAppPurchaseWidgetState extends State<InAppPurchaseWidget> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String? _queryProductError;

  @override
  void initState() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen(_listenToPurchaseUpdated, onDone: () {
      _subscription.cancel();
    }, onError: (Object error) {
      print("Error on purchaseStream: ${error}");
    });

    initStoreInfo();
    super.initState();
  }

  Future<void> initStoreInfo() async {
    _isAvailable = await _inAppPurchase.isAvailable();
    if (!_isAvailable) {
      setState(() {
        _loading = false;
      });
      return;
    }

    final ProductDetailsResponse productDetailResponse = await _inAppPurchase
        .queryProductDetails({'dev_66c5db753d0325da603c90f9'});
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
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

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3894B5),
        title: const Text('SUBSCRIPTION'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _buildProductList(),
    );
  }

  Widget buildProductCard(ProductDetails productDetails) {
    return Container(
      // padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8.0),
      //   border: Border.all(color: const Color(0xff3894B5), width: 1.5),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.1),
      //       spreadRadius: 3,
      //       blurRadius: 5,
      //       offset: const Offset(0, 3),
      //     ),
      //   ],
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Text(
            "Access all your health data at the touch of a button.",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: const Color(0xff3894B5), width: 1.5),
            ),
            child: Column(
              children: [
                // Plan Name
                Icon(Icons.account_balance_wallet,
                    size: 40,
                    color:
                        const Color(0xff3894B5)), // Icon as in the screenshot
                const SizedBox(height: 8),
                Text(
                  "STANDARD",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff3894B5),
                  ),
                ),
                const SizedBox(height: 8),
                // Price and Duration
                Text(
                  "${productDetails.price}/year", // Price from product details
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff3894B5),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Feature List
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFeatureRow("Get a wellbeing score"),
                    buildFeatureRow("26 wellbeing scans included"),
                    buildFeatureRow("Keep track of your vitals"),
                    buildFeatureRow("Daily medication reminders"),
                    buildFeatureRow("Store your medical records"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          // Join Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _buyConsumable(productDetails),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3894B5),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Join',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureRow(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: const Color(0xff3894B5)),
          const SizedBox(width: 8.0),
          Text(
            feature,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    if (_queryProductError != null) {
      return Center(child: Text(_queryProductError!));
    }

    if (!_isAvailable || _products.isEmpty) {
      return const Center(child: Text('No products available.'));
    }

    return ListView(
      children: _products.map((ProductDetails productDetails) {
        return buildProductCard(productDetails);
      }).toList(),
    );
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
        '66c5db753d0325da603c90f9', purchaseDetails.purchaseID!);
  }

  void _handlePurchaseError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
    widget.failureCallback();
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
