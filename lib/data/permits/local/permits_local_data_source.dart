import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../core/shared_preferences/prefs_keys.dart';
import '../../../core/shared_preferences/shared_prefs.dart';
import '../models/visitor_permit_model.dart';
import '../models/delivery_permit_model.dart';

abstract class PermitsLocalDataSource {
  Future<void> saveVisitorPermits(List<VisitorPermitModel> permits);
  Future<List<VisitorPermitModel>> getVisitorPermits();
  
  Future<void> saveDeliveryPermits(List<DeliveryPermitModel> permits);
  Future<List<DeliveryPermitModel>> getDeliveryPermits();

  Future<void> clearAllPermits();
}

class PermitsLocalDataSourceImpl implements PermitsLocalDataSource {
  final SharedPrefs _sharedPrefs;

  PermitsLocalDataSourceImpl(this._sharedPrefs);

  @override
  Future<void> saveVisitorPermits(List<VisitorPermitModel> permits) async {
    try {
      final jsonList = permits.map((p) => p.toJson()).toList();
      await _sharedPrefs.saveSecuredValue(
        key: PrefsKeys.visitorPermitsCache,
        value: jsonList,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error saving visitor permits to local: $e');
      }
    }
  }

  @override
  Future<List<VisitorPermitModel>> getVisitorPermits() async {
    try {
      final List<dynamic>? jsonList = await _sharedPrefs.getSecuredValue<List<dynamic>>(
        key: PrefsKeys.visitorPermitsCache,
      );
      
      if (jsonList == null) return [];
      
      return jsonList.map((j) => VisitorPermitModel.fromJson(j)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error getting visitor permits from local: $e');
      }
      return [];
    }
  }

  @override
  Future<void> saveDeliveryPermits(List<DeliveryPermitModel> permits) async {
    try {
      final jsonList = permits.map((p) => p.toJson()).toList();
      await _sharedPrefs.saveSecuredValue(
        key: PrefsKeys.deliveryPermitsCache,
        value: jsonList,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error saving delivery permits to local: $e');
      }
    }
  }

  @override
  Future<List<DeliveryPermitModel>> getDeliveryPermits() async {
    try {
      final List<dynamic>? jsonList = await _sharedPrefs.getSecuredValue<List<dynamic>>(
        key: PrefsKeys.deliveryPermitsCache,
      );
      
      if (jsonList == null) return [];
      
      return jsonList.map((j) => DeliveryPermitModel.fromJson(j)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error getting delivery permits from local: $e');
      }
      return [];
    }
  }

  @override
  Future<void> clearAllPermits() async {
    await _sharedPrefs.deleteSecuredValue(key: PrefsKeys.visitorPermitsCache);
    await _sharedPrefs.deleteSecuredValue(key: PrefsKeys.deliveryPermitsCache);
  }
}
