require 'rails_helper'

RSpec.describe 'Employees', type: :request do
  describe 'GET /employees' do
    it 'requires to be signed in' do
      get '/employees'
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to include('You need to sign in or sign up before continuing.')
    end

    it 'returns all employees' do
      employee = Employee.create!(email: 'test@mail.com', password: 'password')
      sign_in(employee)
      auth_params = get_auth_params_from_login_response_headers(response)

      get '/employees', headers: auth_params
      expect(response).to have_http_status(:success)

      json_response = response.parsed_body
      expect(json_response.size).to eq(1)
      expect(json_response.first['email']).to eq(employee.email)
      expect(json_response.first['id']).to eq(employee.id)
    end
  end
end
