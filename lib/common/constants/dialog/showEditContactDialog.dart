// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post/core/styles/appIcons.dart';
import 'package:post/core/styles/appStyle.dart';
import 'package:post/core/styles/appText.dart';

import '../../../core/styles/appColors.dart';
import '../../../core/utils/validator/validator.dart';
import '../../../data/model/contact_model/contact_model.dart';
import '../../../presentation/contact_screen/contact_bloc.dart';
import '../button/text_button.dart';
import '../text_field/text_field.dart';

class ShowDialog {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void showAddOrUpdateDialog(BuildContext context, [int? index]) {
    final contactBloc = BlocProvider.of<ContactBloc>(context);
    if (index != null) {
      final contact = (contactBloc.state as ContactLoaded).contacts[index];
      nameController.text = contact.name;
      phoneController.text = contact.phone;
      emailController.text = contact.email;
    } else {
      nameController.clear();
      phoneController.clear();
      emailController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            index != null
                ? AppText.textTitleShowDialogEdit
                : AppText.textTitleShowDialogAdd,
            textAlign: TextAlign.center,
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Custom_TextField(
                  controller: nameController,
                  labelText: AppText.textLabelTextShowDialog,
                  hintText: 'Enter your name',
                  prefixIcon: AppIcons.prefixIconFirst,
                  validator: Validator.nameValidator,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                Custom_TextField(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: AppIcons.prefixIconSecond,
                  validator: Validator.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                Custom_TextField(
                  controller: phoneController,
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  prefixIcon: AppIcons.prefixIconThird,
                  validator: Validator.phoneNumberValidator,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            CustomTextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newContact = Contact(
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                    );
                    contactBloc.add(AddOrUpdateContact(newContact, index));
                    Navigator.pop(context);
                  }
                },
                text: index != null ? 'Save' : 'Add',
                backgroundColor: AppColor.backgroundColorButton,
                textColor: AppColor.backgroundColor,
                padding: Appstyle.paddingThird,
                fontWeight: FontWeight.bold,
                fontSize: Appstyle.fontSize.toDouble()),
            CustomTextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Cancel',
              fontSize: Appstyle.fontSize.toDouble(),
              backgroundColor: AppColor.grey,
              textColor: AppColor.backgroundColor,
              padding: Appstyle.paddingThird,
              fontWeight: FontWeight.bold,
            ),
          ],
        );
      },
    );
  }
}
