module Cran
  class PackageParser
    def self.parse!(package)
      new(package).parse!
    end

    def initialize(package)
      @name = package["Package"]
      @version = package["Version"]
    end

    def parse!
      Rails.logger.info "--- Parsing package #{@name} #{@version}"

      Dcf.parse(content)[0]
    end

    private

    def content
      @content = ""

      Archive::Tar::Minitar::Input.open zip do |tar|
        tar.each do |file|
          @content = file.read if file.name.match(/DESCRIPTION/)
        end
      end

      @content
    end

    def zip
      Zlib::GzipReader.new StringIO.new(zipped_content)
    end

    def zipped_content
      Net::HTTP.get *PackagesUrl.for(@name, @version)
    end
  end
end
