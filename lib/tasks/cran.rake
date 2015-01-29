namespace :cran do
  desc "Fetch and parse packages"
  task update: :environment do
    Cran::PackagesCrawler.fetch!
  end
end
