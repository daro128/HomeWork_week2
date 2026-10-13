enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipcode;

  Address(this._street, this._city, this._zipcode);

  String get getStreet => _street;
  String get getCity => _city;
  String get getZipcode => _zipcode;
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final Address _address;
  final int _yearsOfExperience;

  Employee({
    required this._name,
    required this._baseSalary,
    required this._address,
    required this._yearsOfExperience,
    required List<Skill> skill,
  }) : _skill = List.unmodifiable(skill);

  String get getName => _name;
  double get getBaseSalary => _baseSalary;
  List<Skill> get getSkill => _skill;
  Address get getAddress => _address;
  int get getYearExp => _yearsOfExperience;

  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearsOfExperience,
  }) : this(
         name: name,
         baseSalary: baseSalary,
         address: address,
         yearsOfExperience: yearsOfExperience,
         skill: [Skill.FLUTTER, Skill.DART],
       );

  double calculateSalary (){
      double total = _baseSalary;
      total+=_yearsOfExperience*2000;
      for (var s in _skill){
        if(s==Skill.FLUTTER){
          total+=5000;
        }else if(s== Skill.DART){
          total+=3000;
        }else{
          total+=1000;
        }
      }
    return total;
  }
  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary} totalSalary: \$${calculateSalary()}');
  }
}


void main() {
  var emp1 = Employee(name: 'Sokea', baseSalary: 40000,address: Address("168","Phnom Penh","11") , yearsOfExperience: 10,skill: [Skill.DART]);
  emp1.printDetails();

  var emp2 = Employee(name: 'Ronan', baseSalary: 45000,address: Address("111", "Preveng","11"), yearsOfExperience: 15,skill: [Skill.FLUTTER]);
  emp2.printDetails();

  final emp = Employee.mobileDeveloper( name: 'Sokea', baseSalary: 40000, address: Address('Street 1', 'Phnom Penh', '12000'), yearsOfExperience: 2,);

  emp.printDetails();
  print(emp.getSkill);
}
