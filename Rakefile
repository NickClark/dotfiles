task :default do
  dest = ENV["HOME"]
  force = (ENV["FORCE"] == "true") ? true : false

  #init and update submodules
  puts "Getting submodules"
  puts `git submodule update --init --recursive`

  # Copy over dotfiles
  puts "Copying dotfiles"
  files = Dir["*"].reject do |file|
    ["Rakefile", "README.markdown"].include?(file)
  end

  skip_warned = false
  files.each do |file|
    begin
      FileUtils.ln_s(File.join(FileUtils.pwd, file), File.join(dest, ".#{file}"), :force => force)
    rescue StandardError
      unless skip_warned
        puts "Run rake with FORCE=true to overwrite all linked files."
        skip_warned = true
      end
      puts "Skipped #{file}."
    end
  end

end
