class CreatePackageVersions < ActiveRecord::Migration
  def change
    create_table :package_versions do |t|
      t.integer :package_id
      t.string :version
      t.datetime :publication_date
      t.string :title
      t.text :description

      t.timestamps null: false
    end
    add_index :package_versions, :package_id
    add_foreign_key :package_versions, :packages
  end
end
