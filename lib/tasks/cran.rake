namespace :cran do
  desc "Fetch and parse packages"
  task update: :environment do
    Cran::PackagesCrawler.fetch! jobs: (ENV['jobs'] || 3).to_i
  end
end
