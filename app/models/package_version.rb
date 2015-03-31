class PackageVersion < ActiveRecord::Base
  belongs_to :package

  has_many :authors, dependent: :destroy
  has_many :maintainers, dependent: :destroy

  validates :package, :version, :title, :description, presence: true

  delegate :name, to: :package

  scope :ordered, -> { order(arel_table[:created_at].desc) }

  scope :search, -> (text) {
    condition = arel_table[:version].eq(text)
    condition = arel_table[:title].matches("%#{text}%").or(condition)
    condition = Package.arel_table[:name].matches("%#{text}%").or(condition)
    condition = Author.arel_table[:name].matches("%#{text}%").or(condition)
    condition = Maintainer.arel_table[:name].matches("%#{text}%").or(condition)

    joins(:package).
    joins(%Q(
      LEFT OUTER JOIN authors ON authors.package_version_id = package_versions.id
      LEFT OUTER JOIN maintainers ON maintainers.package_version_id = package_versions.id
    )).
    where(condition).uniq
  }
end
