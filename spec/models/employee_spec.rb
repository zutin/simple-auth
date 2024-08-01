require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do
    it 'should validate presence of email' do
      employee = Employee.new(email: nil)
      expect(employee).to be_invalid
      expect(employee.errors[:email]).to include("can't be blank")
    end

    it 'should validate presence of password' do
      employee = Employee.new(password: nil)
      expect(employee).to be_invalid
      expect(employee.errors[:password]).to include("can't be blank")
    end
  end
end
