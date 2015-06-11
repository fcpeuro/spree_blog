SpreeBlog
=========

Introduction goes here.

Installation
------------

Add spree_blog to your Gemfile:

```ruby
gem 'spree_blog', github: 'romul/spree_blog', branch: '2-4-stable'
gem 'spree_editor', github: 'spree-contrib/spree_editor', branch: '2-4-stable'
```

Bundle your dependencies and run the installation generator:

```shell
bundle install
rails g spree_editor:install
rails g ckeditor:install --orm=active_record --backend=paperclip && bundle exec rake db:migrate
rails g spree_blog:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_blog/factories'
```

Copyright (c) 2013 [name of extension creator], released under the New BSD License
