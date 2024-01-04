# frozen_string_literal: true

require_relative "lib/chunky_projects/version"

Gem::Specification.new do |spec|
  spec.name = "chunky_projects"
  spec.version = ChunkyProjects::VERSION
  spec.authors = ["Zach Ahn"]
  spec.email = ["engineering@zachahn.com"]

  spec.summary = "Converts Textile to HTML"
  spec.description = "Converts Textile to HTML. Wraps the Rustextile crate."
  spec.homepage = "https://github.com/zachahn/chunky_projects"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"
  spec.required_rubygems_version = ">= 3.3.11"

  spec.metadata["homepage_uri"] = "https://github.com/zachahn/chunky_projects"
  spec.metadata["source_code_uri"] = "https://github.com/zachahn/chunky_projects"
  spec.metadata["changelog_uri"] = "https://github.com/zachahn/chunky_projects/blob/main/CHANGELOG.md"

  file_patterns = [
    "{ext,lib}/**/*",
    "LICENSE",
    "README.*",
    "*.gemspec",
    "**/Cargo.*"
  ]

  files =
    Dir.chdir(__dir__) { Dir[*file_patterns] }
      .select { |path| File.file?(path) }
      .reject { |path| File.extname(path) == ".bundle" }
      .reject { |path| path.start_with?(/tmp\b/) }

  spec.files = files
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/chunky_projects/Cargo.toml"]
end
