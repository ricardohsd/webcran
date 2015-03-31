module Cran
  class PackageCreator
    def self.create!(package)
      new(package).create!
    end

    def initialize(package, parser = PackageParser)
      @package = parser.parse!(package)
    end

    def create!
      puts "===> Creating package #{@package["Package"]}, Thread #{Thread.current[:name]}"

      package = Package.find_or_create_by(name: @package["Package"])

      package.add_version!(
        title: @package["Title"],
        description: @package["Description"],
        publication_date: @package["Date/Publication"],
        version: @package["Version"],
        authors: authors,
        maintainers: authors(Maintainer)
      )
    end

    private

    def authors(klass = Author)
      @package[klass.to_s].split(/ and |,/).map do |author|
        if match = author.strip.match(/([\w\ .-]+)(?:\<([\w@.-]+)\>)?/)
          name, email = match.captures

          klass.new(name: name.strip, email: email.try(:strip))
        end
      end.compact
    end
  end
end
