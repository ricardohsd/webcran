class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :packages, :name
  end
end
