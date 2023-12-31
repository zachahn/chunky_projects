# frozen_string_literal: true

module ChunkyProjects
end

require_relative "chunky_projects/error"
require_relative "chunky_projects/version"
require_relative "chunky_projects/public"

begin
  ruby_version = RUBY_VERSION[/^\d+\.\d+/]
  require_relative "chunky_projects/#{ruby_version}/internal"
rescue LoadError
  require "chunky_projects/internal"
end
