class PackagesController < ApplicationController
  has_scope :search
  has_scope :dependent_package_name

  def index
    @packages = apply_scopes(PackageVersion).includes(:package).uniq.ordered
  end

  def show
    @package = Package.find(params[:id])
    @versions = @package.versions
  end
end
