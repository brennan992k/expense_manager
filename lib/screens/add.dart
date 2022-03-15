import 'package:expense_manager/components/custom_button.dart';
import 'package:expense_manager/components/custom_input.dart';
import 'package:expense_manager/models/creditcard_model.dart';
import 'package:expense_manager/providers/creditcard_provider.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _nameC;
  late final TextEditingController _numberC;
  late final TextEditingController _bankNameC;
  late final TextEditingController _balanceC;
  late final TextEditingController _currencyC;

  void _onAdd(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final CreditCardModel creditcard = CreditCardModel(
          id: Uuid().v1(),
          name: _nameC.text,
          bank: _bankNameC.text,
          number: _numberC.text,
          balance: _balanceC.text,
          curency: _currencyC.text,
          available: 1);
      context.read<CreditCardProvider>().addCreditCard(
          creditcard: creditcard,
          onSuccess: (card) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(' ${card.name} added success')));
            Navigator.of(context).pop();
          },
          onFailure: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add card failure')));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Add Card',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppTheme.spacing1),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomInput(
                      autofocus: true,
                      placeholder: 'Card name',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Card name is required'),
                      ]),
                      controller: (controller) => _nameC = controller,
                    ),
                    SizedBox(
                      height: AppTheme.spacing1,
                    ),
                    CustomInput(
                      placeholder: 'Card number',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Card number is required'),
                        MinLengthValidator(13,
                            errorText:
                                'Card number must be at least 13 digits long'),
                        MaxLengthValidator(16,
                            errorText:
                                'Card number must be at lot of 16 digits long')
                      ]),
                      controller: (controller) => _numberC = controller,
                    ),
                    SizedBox(
                      height: AppTheme.spacing1,
                    ),
                    CustomInput(
                      placeholder: 'Bank Name',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Bank Name is required'),
                      ]),
                      controller: (controller) => _bankNameC = controller,
                    ),
                    SizedBox(
                      height: AppTheme.spacing1,
                    ),
                    CustomInput(
                      placeholder: 'Available Balance',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Balance is required'),
                      ]),
                      controller: (controller) => _balanceC = controller,
                    ),
                    SizedBox(
                      height: AppTheme.spacing1,
                    ),
                    CustomInput(
                      placeholder: 'Currency',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Currency is required'),
                        MaxLengthValidator(5,
                            errorText:
                                'Currency must be at lot of 5 digits long'),
                      ]),
                      controller: (controller) => _currencyC = controller,
                    ),
                    SizedBox(
                      height: AppTheme.spacing1,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                          onPressed: () => _onAdd(context),
                          child: Text(
                            'Add',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ))
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
