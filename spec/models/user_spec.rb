# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Attributes' do
    it { should respond_to :email }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :encrypted_password }
    it { should respond_to :reset_password_token }
    it { should respond_to :reset_password_sent_at }
    it { should respond_to :remember_created_at }
  end

  describe 'Validations' do
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
