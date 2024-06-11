import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/profile/blocs/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<ProfileBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("this is profile screen"),
      ),
    );
  }
}
