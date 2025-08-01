import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidatemode,
      key: formkey,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextField(
            hintText: 'Title',
            onsaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
            onsaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(height: 32),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoading ? true : false,
                opTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatedCurrentDate = DateFormat.yMd().format(
                      currentDate,
                    );
                    var noteModel = NoteModel(
                      title: title!,
                      subtitle: subTitle!,
                      date: formatedCurrentDate,
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidatemode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
