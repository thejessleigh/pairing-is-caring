class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :twitter
      t.string :cohort
      t.string :interests
      t.integer :karma

      t.timestamps
    end
  end
end
