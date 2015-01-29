class CreateMaintainers < ActiveRecord::Migration
  def change
    create_table :maintainers do |t|
      t.integer :package_version_id
      t.string :name
      t.string :email

      t.timestamps null: false
    end
    add_index :maintainers, :package_version_id
    add_foreign_key :maintainers, :package_versions
  end
end
