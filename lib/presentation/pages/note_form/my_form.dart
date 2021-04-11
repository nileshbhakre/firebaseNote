import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:noteapp2/application/notes/bloc/my_form_bloc.dart';
import 'package:formz/formz.dart';
//import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(PasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyFormBloc, MyFormState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => SuccessDialog(),
          );
        }
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<MyFormBloc, MyFormState>(
              buildWhen: (p, c) => p.isEditing != c.isEditing,
              builder: (context, state) {
                return state.isEditing
                    ? const Text('Update Note')
                    : const Text('create note');
              }),
          actions: [
            BlocBuilder<MyFormBloc, MyFormState>(
              //buildWhen: (previous, current) => previous.status != current.status,

              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.status.isValidated
                      ? () => context.read<MyFormBloc>().add(FormSubmitted())
                      : null,
                  child: state.isEditing
                      ? const Text('UPDATE')
                      : const Text('SUBMIT'),
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                EmailInput(focusNode: _emailFocusNode),
                PasswordInput(focusNode: _passwordFocusNode),
                SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatefulWidget {
  const EmailInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        //print('state.email.value');
        return TextFormField(
          controller: textEditingController
            ..text = state.email.value
            ..selection = TextSelection.collapsed(
                offset: textEditingController.text.length),
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Title',
            errorText: state.email.invalid ? 'Note title is empty!' : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<MyFormBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return TextFormField(
          controller: textEditingController
            ..text = state.password.value
            ..selection = TextSelection.collapsed(
                offset: textEditingController.text.length),
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            labelText: 'Body',
            errorMaxLines: 2,
            errorText: state.password.invalid ? '''Note is empty.''' : null,
          ),
          maxLines: 10,
          onChanged: (value) {
            context.read<MyFormBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      //buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        print(state.isEditing);
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () => context.read<MyFormBloc>().add(FormSubmitted())
              : null,
          child: state.isEditing ? const Text('UPDATE') : const Text('SUBMIT'),
        );
      },
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Icon(Icons.info),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Form Submitted Successfully!',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () =>
                  AutoRouter.of(context).popUntilRouteWithName('NotePageRoute'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
