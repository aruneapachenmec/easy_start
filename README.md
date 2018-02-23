# EasyStart

EasyStart will allow users to run certain rails commands (mainly used in local development environment) related to a application from anywhere in terminal. User need not change directory to the application root for running commands like `rails s` , `rails c` etc. Just adding the application path and application name to the meta data is required to use this gem. 

After adding the application data, you can lauch the rails server of the application from anywhere in the terminal by running the following command

	$ easy_start application_name

The Gem will start the rails server on port 3000.

EasyStart also supports switching branches, mentioning the port, opening rails console.

Add multiple projects and start their server or access their console with a single command.
 

## Installation

    $ gem install easy_start

## Usage

After installing the gem, add the rails application that needs to be started by the following command
	
	$ easy_start -a application_name -p application_path

Now you are ready to start your project from anywhere in terminal by 

	$ easy_start application_name

	or

	$ easy_start -l application_name

Switching branches are also supported by EasyStart

	$ easy_start application_name branch_name

	or

	$ easy_start -l application_name -b branch_name

Note: mentioning branch name will switch the application directory to that branch and will automatically pull the latest version of the branch before starting the server( the branch should be available locally for it to work as expected).

Mentioning the port to be used by the server

	$ easy_start -l application_name -P 4000

By default application will run on port 3000.

Opening rails console

	$ easy_start -l application_name -P 4000



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/easy_start.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
