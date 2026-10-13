class BankAccount {
  final int _id;
  final String _nameOwner;
  double _balance;
  BankAccount({
    required int id,
    required String nameOwner,
    required double balance,
  }) : _id = id,
       _nameOwner = nameOwner,
       _balance = balance;
  int get id => _id;
  String get name => _nameOwner;
  double get balance => _balance;

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception("You balance not enough>.");
    }
    _balance -= amount;
  }

  void credit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }
}

class Bank {
  final String _name;
  final List<BankAccount> _accs = [];

  Bank({required this._name});

  String get name => _name;
  List<BankAccount> get Accs => _accs;

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accs) {
      if (account._id == accountId) {
        throw Exception('this acc already exist>.');
      }
    }
    var newAcc = BankAccount(
      id: accountId,
      nameOwner: accountOwner,
      balance: 0.0,
    );
    _accs.add(newAcc);
    return newAcc;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
