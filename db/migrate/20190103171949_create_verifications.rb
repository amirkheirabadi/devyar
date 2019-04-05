class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.string :email,         null: true, default: ""
      t.string :password,      null: true, default: ""

      t.string :code,          null: true, default: ""

      t.timestamps null: false
    end

    add_index :verifications, :email,                unique: true
  end
end
