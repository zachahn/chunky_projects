# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "standard/rake"

require "rb_sys/extensiontask"

task build: :compile

GEMSPEC = Gem::Specification.load("chunky_projects.gemspec")

RbSys::ExtensionTask.new("chunky_projects", GEMSPEC) do |ext|
  ext.lib_dir = "lib/chunky_projects"
end

task default: %i[compile test standard]
