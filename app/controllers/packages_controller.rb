class PackagesController < ApplicationController
  def index
    @packages = PackageVersion.includes(:package).ordered

    if params[:search]
      @packages = @packages.search(params[:search])
    end
  end
end
