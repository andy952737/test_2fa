class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :google_secret, :string
    add_column :users, :mfa_secret, :integer
  end
end
