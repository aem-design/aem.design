require "html-proofer"

Jekyll::Hooks.register :site, :post_write do |site|
  HTMLProofer.check_directory(site.config["destination"], opts = {
    :check_html => true,
    :check_img_http => true,
    :disable_external => true,
    :report_invalid_tags => true,
    :assume_extension => ".html",
    :allow_hash_href => true,
    :verbose => true,
    :internal_domains => ["localhost:8100","localhost:8111", "localhost"],
    :root_dir => "_site",
    :ignore_urls => [
      /#data=/,
      /localhost/,
      /localhost:4502/,
      /localhost:4503/,
      /author.localhost/,
      /publish.localhost/,
      /0.0.0.0/,
      /192.168/,
      /\/manifesto\//
    ],
    :extension => ".html",
    :log_level => :debug,
  }).run
end
