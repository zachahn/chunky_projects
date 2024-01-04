# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"
require "standard/rake"
require "rb_sys/extensiontask"

GEMSPEC = Gem::Specification.load("chunky_projects.gemspec")
RbSys::ExtensionTask.new("chunky_projects", GEMSPEC) do |ext|
  ext.lib_dir = "lib/chunky_projects"
end

Minitest::TestTask.create

task build: :compile
task test: :compile
task default: %i[test standard]
