class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string        :name
      t.string        :cpf
      t.date          :date_of_birth
      t.string        :zip_code
      t.string        :address
      t.string        :address_number
      t.string        :address_compl
      t.string        :address_district
      t.string        :address_city
      t.string        :address_state
      t.timestamps null: false
    end
  end
end
