# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"
require "standard/rake"
require "rb_sys/extensiontask"

GEMSPEC = Gem::Specification.load("chunky_projects.gemspec")
RbSys::ExtensionTask.new("internal", GEMSPEC) do |ext|
  ext.lib_dir = "lib/chunky_projects"
end

PLATFORMS = %w[
  arm64-darwin
  x86_64-darwin
  x86_64-linux
]

RUBY_VERSIONS = %w[3.1 3.2 3.3]

namespace :build do
  namespace :native do
    PLATFORMS.each do |platform|
      desc "Build native gem for #{platform}"
      task :"#{platform}" do
        sh "bundle", "exec", "rb-sys-dock", "--build", "--platform", platform, "--ruby-versions", RUBY_VERSIONS.join(",")
      end
    end
  end

  desc "Build all native gems"
  task native: PLATFORMS.map { |platform| "native:#{platform}" }
end

CLEAN.push("lib/**/*.bundle")

Minitest::TestTask.create

task build: :compile
task test: :compile
task default: %i[test standard]
