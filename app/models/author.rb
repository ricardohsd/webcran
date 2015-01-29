class Author < ActiveRecord::Base
  belongs_to :package_version

  validates :name, presence: true

  def to_s
    text = name
    text << " <#{email}>" if email.present?
    text
  end
end
