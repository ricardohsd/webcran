class Package < ActiveRecord::Base
  has_many :versions, class_name: "PackageVersion", dependent: :destroy

  validates :name, presence: true

  def add_version!(attributes)
    return if versions.exists?(version: attributes["version"])

    versions.create!(attributes)
  end
end
