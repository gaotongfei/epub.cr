# epub

[![Build Status](https://travis-ci.org/gaotongfei/epub.cr.svg?branch=master)](https://travis-ci.org/gaotongfei/epub.cr)

A Crystal shards for parsing epub metadata.

## Installation

1. Add the dependency to your `shard.yml`:
```yaml
dependencies:
  epub:
    github: gaotongfei/epub
```
2. Run `shards install`

## Usage

```crystal
require "epub"
```

### Parsing Metadata

```crystal
doc = Epub::Document.new("/path/to/your.epub")
metadata = doc.metadata
metadata["identifier"]  # => "code.google.com.epub-samples.wasteland-basic"
metadata["title"]  # => "The Waste Land"
metadata["language"]  # => "en-US"
metadata["date"]  # => "2011-09-01"
metadata["rights"]  # => "This work is shared with ..."
```

## Contributing

1. Fork it (<https://github.com/gaotongfei/epub/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [gaotongfei](https://github.com/gaotongfei) - creator and maintainer
