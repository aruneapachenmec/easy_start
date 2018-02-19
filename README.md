# EasyStart

EasyStart will allow users to quickly start the local rails server in a single command. This gem is intended to be used only in development mode. 

	$ easy_start project_name
the above command will start the rails server in your local machine and you are ready to go to your browser to test or develop your application. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_start'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_start

## Usage

After installing the gem, add the projects that needs to be started by the following command
	
	$ easy_start -a project_name -p project_path

Now you are ready to start your project from anywhere in terminal by 

	$ easy_start project_name

Switching branches are also supported by EasyStart

	$ easy_start project_name branch_name

Note: mentioning branch name will switch the application directory to that branch and will automatically pull the latest version of the branch before starting the server.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/easy_start.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
