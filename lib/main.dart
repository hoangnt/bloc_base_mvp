import 'package:flutter/material.dart';
import 'package:monki_bloc/app.dart';
import 'package:monki_bloc/config/injection.dart';

void main() {
  dependenciesInjection();
  runApp(const MyApp());
}
