class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.integer :package_version_id, null: false
      t.string :name, null: false
      t.string :version

      t.timestamps null: false
    end
    add_index :dependencies, :package_version_id
    add_foreign_key :dependencies, :package_versions
  end
end
