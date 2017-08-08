require_relative 'employee'

class Manager < Employee
  def initialize(employees)
    @employees = []

  end

  def bonus(multiplier)
    employee_salaries = @employees.reduce(0) { |employee| employee.salary }
    super(employee_salaries)
  end

end
