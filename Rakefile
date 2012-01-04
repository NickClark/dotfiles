task :default do
  dest = ENV["HOME"]
  force = (ENV["FORCE"] == "true") ? true : false

  # Copy over dotfiles
  files = Dir["*"].reject do |file|
    ["Rakefile", "README.markdown"].include?(file)
  end

  files.each do |file|
    FileUtils.ln_s(File.join(FileUtils.pwd, file), File.join(dest, ".#{file}"), :force => force)
  end

  # Setup oh-my-zsh
  `git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

  # Setup janus
  `curl -Lo- http://bit.ly/janus-bootstrap | bash`
  `cd ~/.vim && rvm system && rake`
end
