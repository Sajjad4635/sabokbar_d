class ServiceIconShower {
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
          return 'assets/icons/wallet_icon.svg';
        }

      case 'refund':
        {
          return 'assets/icons/wallet_icon.svg';
        }

      case 'bill':
        {
          return 'assets/icons/bill_transaction_icon.svg';
        }
      case 'violation_fee_payment':
        {
          return 'assets/icons/car_transaction_icon.svg';
        }

      case 'charge':
        {
          return 'assets/icons/charge_transaction_icon.svg';
        }

      case 'internet':
        {
          return 'assets/icons/internet_transaction_icon.svg';
        }

      case 'car_tools':
        {
          return 'خودرو'; 
        }

      case 'my_tehran':
        {
          return 'bill_transaction_icon.svg';
        }

      case 'insurance':
        {
          return 'بیمه';
        }

      default:
        {
          return '';
        }
    }
  }
}
