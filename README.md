# Wrapomatic

Wrapomatic is a naive text line wrapper that also supports indentation for the wrapped text.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wrapomatic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wrapomatic

## Usage

```ruby
require 'wrapomatic'

text = <<-EOT
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

And THAT was a lot of text on one line!
EOT

Wrapomatic.wrap(text, indents: 1, columns: 40)

# => "  Lorem ipsum dolor sit amet,\n  consectetur adipiscing elit, sed do\n  eiusmod tempor incididunt ut labore et\n  dolore magna aliqua. Ut enim ad minim\n  veniam, quis nostrud exercitation\n  ullamco laboris nisi ut aliquip ex ea\n  commodo consequat. Duis aute irure\n  dolor in reprehenderit in voluptate\n  velit esse cillum dolore eu fugiat\n  nulla pariatur. Excepteur sint\n  occaecat cupidatat non proident, sunt\n  in culpa qui officia deserunt mollit\n  anim id est laborum.\n  \n  And THAT was a lot of text on one\n  line!"
```

## Development

Branches and releases for this project are managed by [git-flow](https://github.com/nvie/gitflow).

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wrapomatic/fork )
2. Create your feature branch off of develop (`git checkout develop ; git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
