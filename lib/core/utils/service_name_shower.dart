class ServiceNameShower {
  static String byServiceName({required String input}) {
    switch (input) {
      case 'withdraw_wallet':
        {
          return 'انتقال وجه از کیف پول';
        }

      case 'deposit_wallet':
        {
          return 'واریز به کیف پول';
        }

      case 'wallet_payment':
        {
          return 'پرداخت از کیف پول';
        }

      case 'refund':
        {
          return 'استرداد وجه';
        }

      case 'bill':
        {
          return 'پرداخت قبض';
        }
      case 'violation_fee_payment':
        {
          return 'استعلام خلافی خودرو';
        }

      case 'charge':
        {
          return 'خرید شارژ';
        }

      case 'internet':
        {
          return 'خرید بسته اینترنت';
        }

      case 'car_tools':
        {
          return 'خودرو';
        }

      case 'my_tehran':
        {
          return 'تهران من';
        }
      case 'car_bill':
        {
          return 'خدمات خودرو';
        }

      case 'insurance':
        {
          return 'بیمه';
        }
      case 'tourism':
        {
          return 'گردشگری';
        }
      case 'turkey_rent':
        {
          return 'کرایه خودرو';
        }

      default:
        {
          return '';
        }
    }
  }
}
