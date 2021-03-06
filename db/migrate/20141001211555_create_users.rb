class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.string :email
      t.string :oauth_token
      t.string :role, default: "default"
      t.timestamps
    end
  end
end
