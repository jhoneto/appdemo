require 'rails_helper'

RSpec.describe Employee, :type => :model do
  it "valid employee" do
    employee = FactoryGirl.build(:employee)
    expect(employee.valid?).to be_truthy
  end
  it "invalid employee without name" do
    employee = FactoryGirl.build(:employee, name: nil)
    employee.valid?
    expect(employee.errors[:name].size).to eq(1)
  end
  it "invalid employee without cpf" do
    employee = FactoryGirl.build(:employee, cpf: nil)
    employee.valid?
    expect(employee.errors[:cpf].size).to eq(2)
  end
  it "invalid employee with cpf size diff 11" do
    employee = FactoryGirl.build(:employee, cpf: '1234')
    employee.valid?
    expect(employee.errors[:cpf].size).to eq(1)
  end
end