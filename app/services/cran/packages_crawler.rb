require 'thread'
require_relative '../../models/dependency.rb'
require_relative '../../models/author.rb'
require_relative '../../models/maintainer.rb'
require_relative '../../models/package_version.rb'
require_relative '../../models/package.rb'
require_relative 'packages'
require_relative 'packages_url'
require_relative 'package_parser'
require_relative 'package_creator'

module Cran
  class PackagesCrawler
    def self.fetch!(*attributes)
      new(*attributes).fetch!
    end

    def initialize(jobs: 3)
      self.jobs = jobs
      self.queue = Queue.new
      self.workers = []
    end

    def fetch!
      queue_packages
      process_queue
    end

    private

    attr_accessor :jobs, :queue, :workers

    def process_queue(package_creator = PackageCreator)
      jobs.times do |job|
        workers << Thread.new(job + 1) do |thd|
          Thread.current[:name] = thd

          puts "== Starting worker #{thd}"

          while package = queue.pop do
            package_creator.create!(package)
          end

          puts "=== Finishing worker #{thd}"
          ActiveRecord::Base.connection_pool.release_connection
        end
      end

      workers.map { |t| t.join(timeout) }
    end

    def queue_packages
      packages.each do |package|
        queue.push package
      end
    end

    def packages
      Packages.read
    end

    # This doesn't seems right
    def timeout
      Rails.env.test? ? 0.15 : nil
    end
  end
end
