require 'rails_helper'

feature 'Employee CRUD' do
  
  scenario 'index' do
    visit root_path
    expect(page).to have_content 'Funcionários'
  end

  scenario 'new' do
    visit root_path
    click_link 'Adicionar'
    expect(page).to have_content 'Novo funcionário'
  end

  scenario 'create new employee' do
    visit root_path
    click_link 'Adicionar'
    fill_in 'employee_name', with: 'Daniel Oliveira'
    fill_in 'employee_cpf', with: '00000000000'
    click_button 'Salvar'
    expect(page).to have_content 'Visualização'
  end

  scenario 'edit' do
    employee = create(:employee, name: 'Hamilton')
    visit root_path
    click_link 'Editar'
    expect(page).to have_content 'Editar funcionário'
  end

  scenario 'update employee' do
    employee = create(:employee, name: 'Hamilton')
    visit root_path
    click_link 'Editar'
    fill_in 'employee_name', with: 'Daniel Oliveira'
    fill_in 'employee_cpf', with: '00000000000'
    click_button 'Salvar'
    expect(page).to have_content 'Visualização'
  end

  scenario 'destroy employee' do
    employee = create(:employee, name: 'Hamilton')
    visit root_path
    expect { click_link('Excluir') }.to change(Employee, :count).by(-1)
    expect(page).to have_content 'Funcionários'
  end

end