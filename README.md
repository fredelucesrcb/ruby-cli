# Ruby CLI

Simple Ruby Application that can only be run from the CLI.

------------
## Prerequisites
- [Ruby](https://www.ruby-lang.org/en/ "Ruby")
- [Git](https://git-scm.com/ "Git")

## Dependencies

- [Thor](http://whatisthor.com/ "Thor")
- [Rspec](https://rspec.info/ "Rspec")

------------

## Setup
1. Open a terminal
2. Clone this repository
`git clone https://github.com/fredelucesrcb/ruby-cli.git`
3. Go into directory
`cd ruby-cli`
3. Install gems
`bundle`

## Usage
### Search for users containing a substring in their full_name
#### Arguments
| Argument  | Description   |
| ------------ | ------------ |
|  name | **required**.*string*. substring that will be used for searching  |
|  case_sensitive | default: false.**optional**.*boolean*. denotes if the search will be taking into consideration the case of the input.  |

#### Running the command
To run the command: 

` ruby users.rb findSubstr smith`

To run the command with the optional argument `case_sensitive`: 

` ruby users.rb findSubstr smith true`

### Check if there are duplicates of email withtin the data set.

#### Running the command
`ruby users.rb duplicates`

### Running Tests

Run the following command to run the tests found in `spec/users_spec.rb`

`bundle exec rspec`

## Assumptions and Decisions Made

The project utilizes the Thor gem. Thor is a popular library for building CLIs in Ruby. Thor ships with the rails app and is extensively used by many aspects of the framework. The decision was made to incorporate this in order to lessen the guesswork of coding a CLI-only app. 

For Testing, RSpec was utilized. RSpec is a popular testing framework for Ruby. The author is most familiar with RSpec and the features RSpec has are sufficient for this project.

## Limitations 

This project utilizes a JSON file that is taken from a URL. If ever that resource is taken off the internet, then the data source is void, effectively rendering the features of this project useless.

The project has limited scope in terms of portability since it isn't a package/gem and cannot be incorporated into existing projects as is without reconfiguring the entire structure of the project it will be incorporated into.

## Areas for future improvement

Some possible future improvements for the project are the following:

1. Packaging the project as a Gem.
2. improving UI by refactoring it into a web app that can handle form submissions.
3. Integrating Cucumber for more robust testing or implementing Capybara if the web app path is to be taken.
4. Getting the data from a secure and permanent source like a database or over a CDN.



