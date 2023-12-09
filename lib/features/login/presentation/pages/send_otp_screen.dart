import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/button_widget.dart';
import 'package:sabokbar_d/core/widgets/loading_widget.dart';
import 'package:sabokbar_d/core/widgets/text_field_widget.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';
import 'package:sabokbar_d/features/login/domain/use_cases/params/send_otp_params.dart';
import 'package:sabokbar_d/features/login/presentation/manager/login_bloc.dart';
import 'package:sabokbar_d/injection.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => serviceLocator<LoginBloc>(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              print(';;;;;;;;;;;$state');
              if(state is Error){
                print(
                  state.message
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget.regular(text: 'ورود', alignment: TextAlign.center, fontSize: 32.0),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextWidget.regular(text: 'شماره تماس خود را وارد کنید', alignment: TextAlign.center, fontSize: 16.0),
                  const SizedBox(
                    height: 40.0,
                  ),
                  PhoneNumberTextField(
                    hintText: '09',
                    textController: phoneNumberController,
                    // focusNode: FocusNode(),
                    isEmpty: true,
                    prefixIcon: const Icon(
                      Icons.phone,
                      size: 18,
                    ),
                    onChanged: (text) {
                      // _controller.nameTextController.refresh();
                    },
                    onSubmitted: (text) {
                      // _controller.lastNameFocusNode.value.requestFocus();
                    },
                    // onValidator: () => Utils.phoneNumberFormatWarning(phoneNumberController.text),
                    // onIconTap: () {
                    //   // _controller.nameTextController.value.text = '';
                    //   // _controller.nameTextController.refresh();
                    // },
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (blocContext, state) {
                      if (state is SendOtpLoadingState) {
                        return Container(
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColor.blue,
                              )),
                          child: const Center(
                            child: LoadingWidget(),
                          ),
                        );
                      } else {
                        return ButtonWidget(
                          isEnabled: true,
                          text: 'ورود',
                          onPressed: () {
                            blocContext.read<LoginBloc>().add(SendOtpEvent(
                                    params: SendOtpParams(
                                  phoneNumber: phoneNumberController.text.toEnglishDigit(),
                                  userId: 'string',
                                  otpPassword: 'string',
                                  token: 'string',
                                )));
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen()));
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
