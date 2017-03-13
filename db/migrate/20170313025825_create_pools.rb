class CreatePools < ActiveRecord::Migration[5.0]
  def change
    create_table :pools do |t|
      t.string :name, null: false
      t.boolean :is_public, default: false
      t.references :owner, references: :users, null: false
      t.timestamps
    end
    create_table :pool_memberships do |t|
      t.references :user
      t.references :pool
      t.timestamps
    end
    add_foreign_key :pools, :users, column: :owner_id
    add_foreign_key :pool_memberships, :users
    add_foreign_key :pool_memberships, :pools
    add_index :pool_memberships, [:user_id, :pool_id], unique: true
  end
end
