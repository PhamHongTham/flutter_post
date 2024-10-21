// contact_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post/common/constants/dialog/showEditContactDialog.dart';
import 'package:post/core/styles/appStyle.dart';
import 'package:post/core/styles/appText.dart';
import '../../core/styles/appColors.dart';
import 'contact_bloc.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundAppBar,
        title: Center(
          child: AppText.textAppBarContact,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => ShowDialog().showAddOrUpdateDialog(context),
          ),
        ],
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ContactLoaded) {
            return ListView.builder(
              padding: Appstyle.paddingSecond,
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                final contact = state.contacts[index];
                return Card(
                  child: ListTile(
                    title: Text(contact.phone),
                    leading: Text(contact.name),
                    subtitle: Text(contact.email),
                    onTap: () =>
                        ShowDialog().showAddOrUpdateDialog(context, index),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<ContactBloc>().add(DeleteContact(index));
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is ContactError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
