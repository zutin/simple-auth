# frozen_string_literal: true

class Employee < ApplicationRecord
  extend Devise::Models

  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User
end
