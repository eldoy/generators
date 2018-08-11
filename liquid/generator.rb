#!/usr/bin/env ruby

####
# Generators for sinatra, liquid, mongomapper
# Will create
#      1. Restful resources
#      2. Views for index, show, delete
####

require 'fileutils'

class Generator

  def initialize(name)
    @name = name
    valid?

    FileUtils.mkdir_p('build')

    files = Dir['templates/*.*']

    files.each do |path|
      c = File.read(path)
      c.gsub!('__name__', name)
      c.gsub!('__Name__', name.capitalize)
      c.gsub!('__NAME__', name.upcase)

      fname = path.split('/')[-1]
      File.open("build/#{fname}", 'w'){|f| f.write(c)}
    end

  end

  private

  def valid?
    if @name.nil? or @name.strip.size < 2
      puts "Name missing or invalid."
      exit(0)
    end
  end

end

generator = Generator.new(ARGV[0])

