# Tableware

Tableware is a tiny gem for making it easier to define data in an text table.
Table rows are parsed into either arrays or hashes.

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
is fine but it can be a pain to format at work with, especially for larger data sets.

Tableware lets you trade a bit of parsing for nicer text tables. Instead of the above, you could write:

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

The upside is that you get a much more human friendly table to read, which will save you time by making it something you can quickly scan over.
The downside is that everything appears on the other side as a string, so you may need to do some `.to_i`ing to convert things back into the type you're expecting.

*Please note* that this isn't always going to be better than defining your data in another format; arrays, giant hashes of doom, JSON/YAML or even CSV may me easier to work with. This is another option and one which may be better for that middle ground when your data makes arrays hard to format but it's not big enough for you to want to extract it to an external file. Or perhaps you just like Cucumber scenario outlines and want something similar in rspec!
Whatever your reasoning, this is just one more option for formatting your data.

This gem has been created as a quick experiement to see if or how ofen this feature could be useful.
If you find it useful, please like it or better yet, extend it!

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

Tableware accepts text tables following these rules:

  - Columns delimited by the `|` character
  - Header row is optional but if specified, it must be followed by a line of `-` or `=` characters
  - Start and end `|` characters on a row are optional; `| A | B |` is the same as `A | B`


Tableware provides two main methods for getting your data back out of the table:

  1. `Tableware.arrays` returns an array of arrays
  2. `Tableware.hashes` returns an array of hashes, where the keys come from the headings row


For example:

```
input = '
      Hero        |    Value     |  Hours Played
      ------------------------------------------
      Phara       |       10     |      22
      Mercy       |        9     |      11
      Winston     |        3     |       2
    '

Tableware.arrays(input)
 # => [
        ['Phara', '10', '22'],
        ['Mercy', '9', '11'],
        ['Winston', '3', '2']
      ]

Tableware.hashes(input)
  #=> [
        { hero: 'Phara', value: '10', hours_played: 22 },
        { hero: 'Mercy', value: '9', hours_played: 11 },
        { hero: 'Winston', value: '3', hours_played: 2 }
      ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tableware. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

