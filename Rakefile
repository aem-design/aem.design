require 'tmpdir'
require 'html-proofer'
HTMLProofer.check_directory("./_site").run

desc "Generate jekyll site"
task :generate do
  puts "## Generating Site with Jekyll"
  system "jekyll build"
end

desc "Generate and publish blog to gh-pages"
task :publish do
  Dir.mktmpdir do |tmp|
    system "mv _site/* #{tmp}"
    system "git checkout -b gh-pages"
    system "rm -rf *"
    system "mv #{tmp}/* ."
    system 'git config --global user.email "max.barrass@gmail.com"'
    system 'git config --global user.name "Max Barrass"'
    system "git add ."
    system "git commit -am 'Codeship Update'"
    system "git remote add ghub git@github.com:aem-design/aem.design.git"
    system "git push -f ghub gh-pages"
  end
end