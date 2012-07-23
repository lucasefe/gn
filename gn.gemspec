# encoding: utf-8
Gem::Specification.new do |s|
  s.name              = "gn"
  s.version           = "0.1.0"
  s.summary           = "Simple Generator for the masses"
  s.description       = "Simple Generator for the masses"
  s.authors           = ["Leandro López", "Michel Martens", "Lucas Florio"]
  s.email             = ["lucasefe@gmail.com"]
  s.homepage          = "http://lucasefe.github.com/gn"
  s.files             = ["lib/gn.rb", "lib/gn/dsl.rb", "bin/gn", "LICENSE", "README"]
  s.license           = "MIT"

  s.add_dependency "mote"
  s.add_dependency "clap"
  s.executables.push("gn")
end
