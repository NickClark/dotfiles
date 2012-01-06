task :default do
  dest = ENV["HOME"]
  force = (ENV["FORCE"] == "true") ? true : false

  #init and update submodules
  puts "Getting submodules"
  `git submodule init`
  `git submodule update`

  # Copy over dotfiles
  puts "Copying dotfiles"
  files = Dir["*"].reject do |file|
    ["Rakefile", "README.markdown"].include?(file)
  end

  skip_warned = false
  files.each do |file|
    begin
      FileUtils.ln_s(File.join(FileUtils.pwd, file), File.join(dest, ".#{file}"), :force => force)
    rescue StandardError => e
      unless skip_warned
        puts "Run rake with FORCE=true to overwrite all linked files."
        skip_warned = true
      end
      puts "Skipped #{file}."
    end
  end

  # Setup oh-my-zsh
  puts "Installing oh-my-zsh"
  `git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

  # Setup janus
  puts "Installing janus"
  `curl -Lo- http://bit.ly/janus-bootstrap | bash`
  `cd ~/.vim && rvm system && rake`
end
