# Tableware

Tableware is a tiny gem for making it slightly easier to define data in an ASCII table.

For example, writing:

```
[
 [ "Type A",   true,   false,   2016 ],
 [ "Type B",   "only on alternating Wednesdays",   false,   2017 ],
 [ "Type C",   :never,   true,   2016 ]
].each do |args|
  // Some test or permissions check or something
end
```
is fine but it can be a pain to format at work with.

Tableware lets you trade a bit of parsing for nicer ASCII. Instead of the above, you could write:

```
table = %q[
  |    Type      |  Valid                           | Infinite   | Year Introduced |
  ----------------------------------------------------------------------------------
  |  Type A      | true                             | false      | 2016            |
  |  Type B      | Only on alternating Wednesdays   | false      | 2017            |
  |  Type C      | never                            | true       | 2016            |
]
Tableware.arrays.each do |args|
  // Some test or permissions check or something
end
```

*Please note* that this isn't going to always be better than defining your data as arrays, or writing your test data as a CSV and parsing it, or creating a giant hash of doom.
This is just another option and one which may be better for that middle ground when you have too many columns for arrays to format nicely and too few rows to warrant throwing them in an external CSV file.
Or perhaps you just like Cucumber scenario outlines and want something similar in rspec!
Whatever your reasoning, this is just one more option.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tableware'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tableware

## Usage

Tableware accepts ASCII tables following these rules:
- Columns delimited by the `|` character
- Header row is optional but if specified, it must be followed by a line of `-` or `=` characters
- Start and end `|` characters on a row are optional; `| A | B |` is the same as `A | B`

Tableware provides two main methods for getting your data back out of the table:
1. `Tableware.arrays` returns an array of arrays
1. `Tableware.hashes` returns an array of hashes, where the keys come from the headings row

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tableware. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

