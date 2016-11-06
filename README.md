# Tableware

Tableware is a tiny gem for making it easier to define data in a text table.
Table rows are parsed into either arrays or hashes.

For example:

```ruby
stats = ' Hero        |    Value     |  Hours Played
          ------------------------------------------
          Phara       |       10     |      22
          Mercy       |        9     |      11
          Winston     |        3     |       2        '

Tableware.arrays(stats)
 # => [
        ['Phara', '10', '22'],
        ['Mercy', '9', '11'],
        ['Winston', '3', '2']
      ]

Tableware.hashes(stats)
  #=> [
        { hero: 'Phara', value: '10', hours_played: 22 },
        { hero: 'Mercy', value: '9', hours_played: 11 },
        { hero: 'Winston', value: '3', hours_played: 2 }
      ]
```

Writing test data or a matrix of permissions in a big hash or nested array is fine, but it can be a pain to format and work with, especially for larger data sets or with items of very different lengths.

Tableware lets you use a more human friendly format so that you can more easily scan and understand the data.

The downside is that everything is treated as a string, so you may need to do some `.to_i`ing to convert things back into the type you're expecting. However, this is a one-time cost and [optimising for reading code is a good idea](http://va.lent.in/optimize-for-readability-first/).

This isn't always going to be better than defining your data in another format, but it is another option. Or perhaps you just like Cucumber scenario outlines and want something similar in rspec!

You can also focus a single row, to help with debugging, by prepending a line with `>`.
For example:

```ruby
words = '  Foo | Bar
         > Yay | Woo
           Zip | Zap '

Tableware.arrays(words)
  #=> [ ['Yay', 'Woo'] ]
```


This gem has been created as a quick experiment to see if or how often this feature could be useful.
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

  Both of these can be seen in use in the example at the top of this README.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AdamWhittingham/tableware. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

