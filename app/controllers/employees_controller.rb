class EmployeesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @employees = Employee.all
    render json: @employees
  end
end
