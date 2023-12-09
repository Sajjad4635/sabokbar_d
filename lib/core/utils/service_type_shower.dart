class ServiceTypeShower {
  static String serviceTypeShower({required String input}) {
    switch (input) {
      case 'Withdraw':
        {
          return 'برداشت';
        }

      case 'Deposit':
        {
          return 'واریز';
        }

      default:
        {
          return '';
        }
    }
  }
}
