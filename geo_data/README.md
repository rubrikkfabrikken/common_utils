# GeoData

Geodata provides a very simple library configuraring and executing requests
against GeoData, as well as wrapping the returned JSON response.

## Usage

### Configuration

```ruby
GeoData.config.tap do |config|
  config.username = 'your-username'
  config.password = 'your-password'
  config.request_url = 'geocodeservice-url'
  config.token_url = 'geocodetoken-url'
end
```

These values can alternatively be configured using the environment variables
`GEODATA_USERNAME`, `GEODATA_PASSWORD`, `GEODATA_REQUEST_URL` and
`GEODATA_TOKEN_URL`.

### Performing requests

```ruby
params = {
    location: {
        x: 'some-longitude',
        y: 'some-latitude',
        spatialReference: { wkid: 4326 }
    }
}

response = GeoData::Request.new('reverseGeocoder', params).perform

# => #<GeoData::Response:0x007f0acdc5beb0 @response={ "addressFields" : [ { "alias" : "Adresse",
#         "length" : 160,
#         "name" : "Adresse",
#         "required" : false,
#         "type" : "esriFieldTypeString"
#       },
#       { "alias" : "Stedsnavn",
#         "length" : 50,
#         "name" : "Stedsnavn",
#         "required" : false,
#         "type" : "esriFieldTypeString"
#       }, ...
```

### Response objects

Response objects behave like a hash and data can be accessed using both symbol
and string indices.

```ruby
response[:currentVersion] # => 10.21
response['currentVersion'] # => 10.21
```

### Logging

A logger can be configured, where log entries of type `info` will be posted.

```ruby
GeoData.logger = Logger.new(STDOUT)
```

The library can also be configured to use Rails' logger.

```ruby
YourApplication::Application.configure do
  config.after_initialize do
    GeoData.logger = Rails.logger
  end
end
```
