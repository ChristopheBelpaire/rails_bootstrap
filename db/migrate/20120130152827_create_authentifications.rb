class CreateAuthentifications < ActiveRecord::Migration
  def change
    create_table :rails_bootstrap_authentifications do |t|
      t.integer :user_id
      t.string :strategy
      t.string :identification
      t.string :username
      t.timestamps
      t.timestamps
    end
  end
end
