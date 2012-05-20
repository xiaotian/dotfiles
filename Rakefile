require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install, :quiet do |t, args|
  replace_all = args[:quiet] ||  false
  processed_os_files = []
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
    src_file = file #same as target by default
    if file =~ /.+\@.+/
      real_file,os = file.split('@')
      next if processed_os_files.include? real_file
      processed_os_files << real_file 
      uname_a = `uname -a`.chomp.downcase
      if uname_a.include? 'darwin'
        os = 'darwin'
      elsif uname_a.include? 'linux'
        if uname_a.include? 'ubuntu'
          os = 'ubuntu'
        else
          os = 'linux'
        end
      elsif uname_a.include? 'freebsd'
        os = 'freebsd'
      end 
      src_file = [real_file, os].join('@')
    end

    file = real_file || file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? src_file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file, src_file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file, src_file)
        when 'y'
          replace_file(file, src_file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file, src_file)
    end
  end
end

def replace_file(file, src_file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file, src_file)
end

def link_file(file, src_file = nil)
  src_file ||= file
  if src_file =~ /.erb/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(src_file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{src_file}" "$HOME/.#{file}"}
  end
end
