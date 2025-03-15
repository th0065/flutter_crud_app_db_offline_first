import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../provider/bien_provider.dart';

class SyncService {
  final BienProvider _bienProvider;

  SyncService(this._bienProvider);

  void startSync() {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        _bienProvider.loadBiens();
      }
    });
  }
}