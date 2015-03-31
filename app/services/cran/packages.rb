module Cran
  class Packages
    def self.read
      new.read
    end

    def read
      Dcf.parse content
    end

    private

    def content
      zip = Zlib::GzipReader.new StringIO.new(zipped_content)
      content = zip.read
      zip.close
      content
    end

    def zipped_content
      Net::HTTP.get *PackagesUrl.packages
    end
  end
end
