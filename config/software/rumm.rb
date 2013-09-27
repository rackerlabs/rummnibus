name "rumm"
version "1.0.0"

dependency "libxml2"
dependency "libxslt"
dependency "nokogiri"
dependency "rubygems"
dependency "bundler"

#relative_path "rumm"

build do
  gem "install rumm"

  FileUtils.mkdir_p "#{install_dir}/bin/"
  Dir["#{Omnibus::Config.project_root}/scripts/*"].each do |s|
    sname = File.basename(s)
    dest = "#{install_dir}/bin/#{sname}"
    File.open(dest, 'w') do |f|
      f.puts "#!#{install_dir}/embedded/bin/ruby"
      f.puts File.read(s)
    end
    FileUtils.chmod 0755, dest
  end
end
