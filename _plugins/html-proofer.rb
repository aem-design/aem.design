require "html-proofer"

Jekyll::Hooks.register :site, :post_write do |site|
  HTMLProofer.check_directory(site.config["destination"], opts = {
    :check_html => true,
    :check_img_http => true,
    :disable_external => true,
    :report_invalid_tags => true,
    :assume_extension => true,
    :url_ignore => ["/#.*/"],
    :internal_domains => ["localhost:8100"],
    :root_dir => "_site",
  }).run
end
