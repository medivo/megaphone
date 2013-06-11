# Megaphone

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'megaphone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install megaphone

## Usage

Example use of Campfire:
```ruby
args = {room_name: 'notifications', ssl: true, token: '[protected]'}
campfire = Megaphone::Campfire.new(args)
p campfire.session
p campfire.room
campfire.speak("Howdy")
```

Example use of TumblerTicket
```ruby
t = Megaphone::TumblerTicket.new(application: "fake_application", deployer_name: "Frankie", rails_env: "development",
                      git_hash: "1234", uri: "http://localhost:3000/", tumbler_api_key: "[protected]")
t.make_post_request
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
