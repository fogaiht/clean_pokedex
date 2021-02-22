import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../shared/components/custom_input_field.dart';
import '../../../shared/components/state_button.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  FocusNode _nameFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.red;
    Color secondaryColor = Colors.white;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          "Create Account",
          style: TextStyle(color: secondaryColor, fontSize: 20),
        ),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/ash.png",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _nameFocusNode,
                    hintText: " Name",
                    onChanged: controller.store.setName,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_emailFocusNode),
                    validator: (v) => controller.validators.validateName(),
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(MdiIcons.account),
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _emailFocusNode,
                    hintText: " E-mail",
                    onChanged: controller.store.setEmail,
                    isEmailField: true,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                    validator: (v) => controller.validators.validateEmail(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _passwordFocusNode,
                    hintText: " Password",
                    onChanged: controller.store.setPassword,
                    isPasswordField: true,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
                    validator: (v) => controller.validators.validatePassword(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    focusNode: _confirmPasswordFocusNode,
                    hintText: " Confirm Password",
                    onChanged: controller.store.setConfirmPassword,
                    isPasswordField: true,
                    onFieldSubmitted: (_) => controller.createAccount(),
                    validator: (v) => controller.validators.validateConfirmPassword(),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 16),
                  RxBuilder(
                    builder: (_) {
                      return StateButton(
                        subState: controller.store.subState,
                        onTap: controller.createAccount,
                        secondaryColor: Colors.red,
                        primaryColor: Colors.white,
                        textLabel: Text(
                          "CREATE",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
