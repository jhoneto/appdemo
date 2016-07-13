class Employee < ActiveRecord::Base
  validates :name, presence: true
  validates :cpf, presence: true, length: { is: 11}
end
