part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class LoadContacts extends ContactEvent {}

class AddOrUpdateContact extends ContactEvent {
  final Contact contact;
  final int? index;

  const AddOrUpdateContact(this.contact, [this.index]);

  @override
  List<Object> get props => [contact, index ?? -1];
}

class DeleteContact extends ContactEvent {
  final int index;

  const DeleteContact(this.index);

  @override
  List<Object> get props => [index];
}
