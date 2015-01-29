class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :package_version_id
      t.string :name
      t.string :email

      t.timestamps null: false
    end
    add_index :authors, :package_version_id
    add_foreign_key :authors, :package_versions
  end
end
