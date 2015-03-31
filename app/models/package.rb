class Package < ActiveRecord::Base
  has_many :versions, class_name: "PackageVersion", dependent: :destroy

  validates :name, presence: true

  def add_version!(attributes)
    if version = versions.find_by(version: attributes[:version])
      version
    else
      versions.create!(attributes)
    end
  end

  def dependencies
    versions.last.try :dependencies
  end
end
