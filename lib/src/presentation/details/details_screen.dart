import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/src/data/remote/contacts/model/contact.dart';
import 'package:flutter_contacts/src/domain/contacts/contact_bloc.dart';
import 'package:flutter_contacts/src/domain/contacts/contact_event.dart';
import 'package:flutter_contacts/src/domain/contacts/contact_state.dart';

class DetailsScreen extends StatefulWidget {
  final Contact contact;

  DetailsScreen({@required this.contact});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // Implement different bloc here...
  ContactBloc contactBloc;

  @override
  void initState() {
    super.initState();
    contactBloc = ContactBloc();
    contactBloc.dispatch(FetchContacts());
  }

  @override
  void dispose() {
    contactBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.fullName),
      ),
      body: BlocBuilder(
        bloc: contactBloc,
        builder: (context, ContactState state) {
          // Show data from bloc here...
          return Image.network(widget.contact.imageUrl);
        },
      ),
    );
  }
}
