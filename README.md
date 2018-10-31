# Kele
Kele is a Ruby Gem API client to access the [Bloc's API](http://docs.blocapi.apiary.io/#).

## Gem features
- Users are able to initialize and authorize Kele with a Bloc username and password
- Users are able to retrieve the current user as a JSON blob
- Users are able to retrieve a list of my mentor's availability
- Users are able to retrieve roadmaps and checkpoints
- Users are able to retrieve a list of their messages, respond to an existing message, and create a new message thread
- Users are able to retrieve a list of checkpoints remaining in my current session

## Installation

  `$ gem install kele`
  `$ gem install json`

## Initialization
  ** Users should use their own Bloc.io email and password to access the API.

  ```ruby
  $ irb
  >> require './lib/kele'
  => true
  >> Kele.new("jane@gmail.com", "abc123")
  ```

## Retrieving Current User's Data`

  ** Retrieve the current user from the Bloc API by defining `get_me` which can be used as follows:

    ```ruby
    $ irb
    >> require './lib/kele'
    => true
    >> kele_client = Kele.new("jane@gmail.com", "abc123")
    >> kele_client.get_me
    ```
## Retrieving a List of Mentor's Available Time Slots
  ** Find your mentor's id in the user data returned by `get_me` to include in the URL. Retrieve a list of a mentor's available time slots for the current user from the Bloc API by defining get_mentor_availability which can be used as follows:

    ```ruby
    $ irb
    >> require './lib/kele'
    => true
    >> kele_client = Kele.new("jane@gmail.com", "abc123")
    >> mentor_id = 99
    >> kele_client.get_mentor_availability(mentor_id)
    ```
