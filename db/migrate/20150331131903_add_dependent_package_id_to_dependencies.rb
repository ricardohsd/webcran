class AddDependentPackageIdToDependencies < ActiveRecord::Migration
  def change
    add_column :dependencies, :dependent_package_id, :integer
    add_index :dependencies, :dependent_package_id
    add_foreign_key :dependencies, :packages, column: :dependent_package_id
  end
end
