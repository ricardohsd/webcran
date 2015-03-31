namespace :cran do
  desc "Fetch and parse packages"
  task update: :environment do
    begin
      Cran::PackagesCrawler.fetch! jobs: (ENV['jobs'] || 3).to_i
    ensure
      Cran::PackagesLinker.run!
    end
  end
end
