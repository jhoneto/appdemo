require 'rails_helper'

describe 'Employee API' do
  before do
    @employee = create(:employee)
  end
  it "list all :index" do
    get employees_path, format: :json
    expect(response).to be_success
  end
  it "show employee :show" do
    get employee_path(id: @employee), format: :json
    expect(response).to be_success
  end
end