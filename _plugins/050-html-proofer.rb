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
      /192.168/,
    ],
    :extension => ".html",
    :log_level => :debug,
  }).run
end
