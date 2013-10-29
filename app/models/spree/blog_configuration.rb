class Spree::BlogConfiguration < Spree::Preferences::Configuration
  preference :blog_default_url, :string, :default => '/spree/blog/:id/:style/:basename.:extension'
  preference :blog_path, :string, :default => ':rails_root/public/spree/blog/:id/:style/:basename.:extension'
  preference :blog_url, :string, :default => '/spree/blog/:id/:style/:basename.:extension'
  preference :blog_styles, :string, :default => "{\"mini\":\"48x32>\",\"blog\":\"300x200>\",\"big\":\"600x300>\", \"thumb\":\"200x133>\"}"
  preference :blog_default_style, :string, :default => 'blog'
end
