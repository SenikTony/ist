# frozen_string_literal: true

Gem::Specification.new do |s|
  s.authors = ["Anton Senik"]
  s.date = "2022-08-02"
  s.description = "Command line tool for downloading images from a given plain text file."
  s.email = ["tony.senik@gmail.com"]
  s.executables = ["ist"]
  s.files = ["README.md"] + Dir.glob("{lib,bin,spec}/**/*")
  s.homepage = "https://github.com/SenikTony/ist"
  s.license = "MIT"
  s.name = "ist"
  s.required_ruby_version = ">= 2.7.6"
  s.summary = "Image scraping tool"
  s.version = "0.1.0"
end
