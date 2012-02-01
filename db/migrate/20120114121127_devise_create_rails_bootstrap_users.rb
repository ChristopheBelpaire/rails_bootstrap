class DeviseCreateRailsBootstrapUsers < ActiveRecord::Migration
  def change
    create_table(:rails_bootstrap_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.boolean :is_admin, :default => false
      t.timestamps
    end

    add_index :rails_bootstrap_users, :email,                :unique => true
    add_index :rails_bootstrap_users, :reset_password_token, :unique => true
    # add_index :rails_bootstrap_users, :confirmation_token,   :unique => true
    # add_index :rails_bootstrap_users, :unlock_token,         :unique => true
    # add_index :rails_bootstrap_users, :authentication_token, :unique => true

    RailsBootstrap::User.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)

  end

end
