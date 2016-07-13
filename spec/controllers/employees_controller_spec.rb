require 'rails_helper'

Rails.describe EmployeesController, :type => :controller do
  describe 'GET #show' do
    it "assigns the requested contact to @employee" do
      employee = create(:employee)
      get :show, id: employee
      expect(assigns(:employee)).to eq employee
    end
  
    it "renders the :show template" do
      employee = create(:employee)
      get :show, id: employee
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "assigns a new Employee to @employee" do
      get :new
      expect(assigns(:employee)).to be_a_new(Employee)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns a new employee to @employee" do
      employee = create(:employee)
      get :edit, id: employee
      expect(assigns(:employee)).to eq employee
    end

    it "renders the :edit template" do
      employee = create(:employee)
      get :edit, id: employee
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "saves the new employee in the database" do
        expect{
          post :create, employee: attributes_for(:employee)
        }.to change(Employee, :count).by(1)
      end

      it "redirects to employees#show" do
        post :create, employee: attributes_for(:employee)
        expect(response).to redirect_to employee_path(assigns[:employee])
      end
    end
    context 'with invalid attributes' do
      it "does not save the new employee in the database" do
        expect{
          post :create, employee: attributes_for(:employee, name: nil)
        }.to_not change(Employee, :count)
      end

      it "re-renders the :new template" do
        post :create, employee: attributes_for(:employee, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @employee = create(:employee, name: 'Hamilton')
    end
    context 'with valid attributes' do
      it "changes employee attributes" do
        patch :update, id: @employee, employee: attributes_for(:employee, name: 'Neto')
        @employee.reload
        expect(@employee.name).to eq 'Neto'
      end

      it "redirects to employees#show" do
        patch :update, id: @employee, employee: attributes_for(:employee, name: 'Neto')
        expect(response).to redirect_to employee_path(assigns[:employee])
      end
    end
    context 'with invalid attributes' do
      it "does not change employee attributes" do
        patch :update, id: @employee, employee: attributes_for(:employee, name: nil)
        @employee.reload
        expect(@employee.name).to eq 'Hamilton'
      end

      it "re-renders the :edit template" do
        patch :update, id: @employee, employee: attributes_for(:employee, name: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @employee = create(:employee)
    end

    it "deletes the employee" do
      expect{
        delete :destroy, id: @employee
      }.to change(Employee,:count).by(-1)
    end
    it "redirects to employees#index" do
      delete :destroy, id: @employee
      expect(response).to redirect_to employees_url
    end
  end

end