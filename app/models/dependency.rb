class Dependency < ActiveRecord::Base
  belongs_to :package_version
  belongs_to :dependent_package, class_name: "Package"

  validates :package_version, :name, presence: true

  def find_dependency!
    update_attribute :dependent_package, Package.find_by(name: name)
  end

  def to_s
    return name if version.blank?

    "#{name} (#{version})"
  end
end
