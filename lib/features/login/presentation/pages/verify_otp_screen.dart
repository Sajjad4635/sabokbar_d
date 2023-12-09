import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/button_widget.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController otpController = TextEditingController();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget.regular(
                        text: 'کد تایید حساب',
                        alignment: TextAlign.center,
                        fontSize: 32.0,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWidget.regular(
                        text: 'شماره وارد شده: 51 26 279 0912',
                        alignment: TextAlign.center,
                        fontSize: 16.0,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.edit, color: AppColor.blue,),
                            const SizedBox(width: 5,),
                            TextWidget.regular(
                              text: 'ویرایش شماره',
                              alignment: TextAlign.center,
                              color: AppColor.blue,
                              fontSize: 16.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          backgroundColor: Colors.white,
                          appContext: context,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          autoFocus: true,
                          keyboardType: TextInputType.number,
                          length: 5,
                          controller: otpController,
                          textStyle: const TextStyle(fontSize: 20, fontFamily: 'iransans'),
                          onChanged: (value) {},
                          pinTheme: PinTheme(
                            fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 8),
                            shape: PinCodeFieldShape.box,
                            activeFillColor: Colors.blue.withOpacity(0.07),
                            selectedFillColor: Colors.blue.withOpacity(0.07),
                            // selectedColor: Colors.blue.withOpacity(0.8),
                            inactiveFillColor: Colors.blue.withOpacity(0.07),
                            inactiveColor: Colors.blue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 56,
                            fieldWidth: 44,
                            activeColor: Colors.blue.withOpacity(0.5),
                          ),
                          enableActiveFill: true,
                          enabled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        // textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CountdownTimer(
                            endTime: endTime,
                            widgetBuilder: (context, time) {
                              if (time == null) {
                                return GestureDetector(
                                  onTap: () {
                                    // context.read<LoginBloc>().add(LoginSendNumber(number: widget.number));
                                    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
                                  },
                                  child: Center(child: TextWidget.regular(text: 'ارسال مجدد')),
                                );
                              } else {
                                return TextWidget.regular(
                                  textDirection: TextDirection.ltr,
                                  text: ('${(time.min ?? '0')}:${time.sec ?? '00'}').toPersianDigit(),
                                );
                              }
                            },
                            // endTime: endTime,
                          ),
                          // const SizedBox(width: 8,),
                          TextWidget.regular(
                            text: 'کد تایید حساب برای شما ارسال شد',
                            alignment: TextAlign.center,
                            fontSize: 16.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 44,),
                      ButtonWidget(
                        isEnabled: true,
                        text: 'ورود',
                        onPressed: () {
                          // print('asd;fjl');
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneNumber()));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen()));
                        },
                      ),
                      // otpController.text.isEmpty
                      //     ? Row(
                      //   children: [
                      //     const Icon(Icons.warning, color: Colors.red,),
                      //     const SizedBox(width: 15.0,),
                      //     TextWidget.regular(text: 'کد وارد شده صحیح نمی‌باشد.', color: Colors.red,)
                      //   ],
                      // )
                      //     : const SizedBox(),
                      // otpController.text.isEmpty
                      //     ? Row(
                      //   children: [
                      //     const Icon(Icons.warning, color: Colors.red,),
                      //     const SizedBox(width: 15.0,),
                      //     TextWidget.regular(text: 'زمان شما به پایان رسید مجددا تلاش کنید.', color: Colors.red,)
                      //   ],
                      // )
                      //     : const SizedBox(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   // children: [errorText()],
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      //        
                      //       },
                      //       child: TextWidget.regular(
                      //         text: 'ارسال مجدد کد',
                      //         // color: _controller.reSendCodeStatus.value ? MyConstants.kBGToastDarkBlue : MyConstants.kColorGreyLight,
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     // _controller.reSendCodeStatus.value
                      //     //     ? const Icon(
                      //     //   Icons.refresh,
                      //     //   color: MyConstants.kBGToastDarkBlue,
                      //     // )
                      //     //     : TextWidget.regular(text: StringUtils.showNumberInClockFormat(_controller.countDownTimer.value))
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
