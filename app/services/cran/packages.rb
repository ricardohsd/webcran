module Cran
  class Packages
    def self.read
      new.read
    end

    def read
      Rails.logger.info "--- Parsing packages"

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
      RestClient.get PackagesUrl.packages
    end
  end
end
