class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.integer :state_id
      t.integer :city_id
      t.string :name
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
