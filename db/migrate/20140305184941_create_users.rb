class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      # t.string :password_digest
      t.string :email
      t.string :gravatar
      # t.string :twitter == > Icebox
      t.integer :cohort_id
      # t.string :interests == > Icebox
      # t.integer :karma == > Icebox



      t.timestamps
    end
  end
end
