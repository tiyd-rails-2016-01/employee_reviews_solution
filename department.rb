require './employee'

class Department
  attr_reader :name, :staff, :review

  def initialize(department_name)
    @name = department_name
    @staff = []
  end

  def add_employee(new_employee)
    @staff << new_employee
  end

  def department_salary
    @staff.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def add_employee_review(review)
    @review = review
  end

  def department_raise(alloted_amount)
    raise_eligible = @staff.select {|e| yield(e)}
    raise_eligible.each {|e| e.salary += alloted_amount / raise_eligible.length}
  end
end
