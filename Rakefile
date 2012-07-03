#require 'rake/packagetask'

DOTFILES = %w[
  .ctags
  .gemrc
  .gitconfig
  .gitignore
  .gvimrc
  .vimrc
  .zshrc
  .jshintrc
  .npmrc
]

task :default => [:ln_dotfiles, :vim_config, :install_zsh]

desc "ln all dotfiles"
task :ln_dotfiles do
  DOTFILES.each do |file|
    puts "--- ln #{file} to $Home ---"
    system "ln -f #{file} ~/"
  end
end


desc "vim: install vim plugins and config"
task :vim_config do
  puts "--- git clone vundle ---"
  system 'git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle'

  puts "--- ln .vimrc .gvimrc ---"
  system 'ln -f .vimrc .gvimrc ~/'

  puts "--- install plugins ---"
  system 'vim +BundleInstall +qa'
end

desc "zsh: install oh-my-zsh"
task :install_zsh do
  puts "--- git clone oh-my-zsh ---"
  system 'git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'

  puts "--- cp .zshrc ---"
  system 'ln -f .zshrc ~/.zshrc'

  puts "--- Set zsh as your default shell ---"
  system 'chsh -s /bin/zsh'
end


