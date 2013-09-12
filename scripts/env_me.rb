#!/usr/bin/env ruby
require 'fileutils'

content = File.readlines('/opt/rumm/embedded/bin/rumm')
content.insert(1, "ENV['PATH'] = \"/opt/rumm/embedded/bin:\#{ENV['PATH']}\"\n")
file = File.open("/opt/rumm/embedded/bin/rumm", 'w')
file.write(content.join)
file.close