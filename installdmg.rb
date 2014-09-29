#!/usr/bin/ruby
require 'pathname'
require 'fileutils'

filename = ARGV[0]
`hdiutil mount #{filename}`
folder_name =  (Pathname(filename.chomp(File.extname(filename))).each_filename.to_a).last
volume_path = "/Volumes/#{folder_name}"
application_paths = Dir["#{volume_path}/*.app"]

application_paths.each do |application_path|
  application_file_name = Pathname(application_path).each_filename.to_a.last
  destination_path = "/Applications/#{application_file_name}"
  if Dir.exists? destination_path
    FileUtils.rm_rf destination_path
  end
  
  FileUtils.cp_r application_path, "/Applications/#{application_file_name}"
end

`hdiutil eject #{volume_path}`

FileUtils.rm_rf filename