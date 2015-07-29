Deface::Override.new(virtual_path:  "spree/admin/shared/_configuration_menu",
                     name:          "blog_admin_configurations_menu",
                     insert_bottom: "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     text:          "<%= configurations_sidebar_menu_item Spree.t(:posts), admin_posts_path %>",
                     disabled:      false)


Deface::Override.new(
  virtual_path:  "spree/admin/shared/_menu",
  name: "blog_admin_menu",
  insert_bottom: 'ul[data-hook="admin_tabs"]',
  text: "<%= tab :posts, :categories, :tags, :authors, :blog_settings, url: spree.admin_posts_path, icon: 'pencil' %>",
  disabled: false
)