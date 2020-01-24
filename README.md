# GovPredict Test


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Esse teste tem como objetivo criar um aplicativo para that lets you view social media posts from lists of people and filter down the results.
# Get-Starting!
You need to install libmagickwand-dev in order to successfully complete the rmagick gem. Following command will do the job for you:
`sudo apt-get install libmagickwand-dev`
On a Mac, you would run the following command:
`brew install imagemagick # it requires you to install Homebrew first.`
I preferred to use the dependencies in GEM instead of node_modules

### The App
>After imagemagick, I'm using version "2.6.5p114" of Ruby and Rails version "5.2.4.1"

run the command
`bundle install`
the run
`rails db:create db:migrate db:seed`
> NOTE: If you want a larger number of Users, Posts and etc. You can change the value in db: seed, as in the command below

  #posts
... #choose quantity in .times
  `100.times do |x|
  user = User.all.sample`
  ...

Now just run `rails s`

Post:
IN PUBLICATIONS YOU CAN SEE

  - USERNAME
  - USERNAME USER
  - LIST OF PEOPLE
  - USER ACCOUNT
  - DATE OF PUBLICATION
  - AND CLICKING THE POST, SEND IT FOR ORIGINAL PUBLICATION

Using filters:
  - USING THE ENTRY, YOU CAN SEARCH SPECIFIC WORDS IN THE POSTAL BODY
  - FILTER BY SPECIFIC LIST
  - SPECIFIC SOCIAL NETWORK FILTER
  - AND DATE OF CREATION FROM A TO B

**Free Software, Hell Yeah \o/ !**
