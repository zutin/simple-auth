class DeviseTokenAuthCreateEmployees < ActiveRecord::Migration[7.1]
  def change

    create_table(:employees) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at
      # t.boolean  :allow_password_change, :default => false

      ## Rememberable
      # t.datetime :remember_created_at

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :email, :null => false

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :employees, :email,                unique: true
    add_index :employees, [:uid, :provider],     unique: true
    # add_index :employees, :reset_password_token, unique: true
    # add_index :employees, :confirmation_token,   unique: true
    # add_index :employees, :unlock_token,         unique: true
  end
end
