import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/model/contact_model/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final Box<Contact> contactBox = Hive.box<Contact>('contactsBox');
  ContactBloc() : super(ContactInitial()) {
    on<LoadContacts>(_onLoadContacts);
    on<AddOrUpdateContact>(_onAddOrUpdateContact);
    on<DeleteContact>(_onDeleteContact);
  }

  void _onLoadContacts(LoadContacts event, Emitter emit) {
    try {
      final contacts = contactBox.values.toList();
      emit(ContactLoaded(contacts));
    } catch (e) {
      emit(const ContactError('Failed to load contacts.'));
    }
  }

  void _onAddOrUpdateContact(AddOrUpdateContact event, Emitter emit) {
    try {
      if (event.index != null) {
        contactBox.putAt(event.index!, event.contact);
      } else {
        contactBox.add(event.contact);
      }
      add(LoadContacts());
    } catch (e) {
      emit(const ContactError('Failed to add or update contact.'));
    }
  }

  void _onDeleteContact(DeleteContact event, Emitter emit) {
    try {
      contactBox.deleteAt(event.index);
      add(LoadContacts());
    } catch (e) {
      emit(const ContactError('Failed to delete contact.'));
    }
  }
}
