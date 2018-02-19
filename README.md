<p align="center"><img src="https://png.icons8.com/dusk/64/000000/parliament.png"></p>

# Welcome to Congressman Find
> A simple CLI to discover information about U.S. Congressional Representatives


Congressman Find is a command line interface to discover current information about the members and committees of the United States Congress.  Using information from [ProPublica](https://www.propublica.org/)'s excellent [Congress API](https://projects.propublica.org/api-docs/congress-api/) it can display Representatives and Senators based on location or committee and deliver the contact information of their offices and social media accounts.



## Installing / Getting started

Congressman Find is written in Ruby and can be used by cloning down a copy of the project as it has not been packaged into an installable as of yet.

It was built and tested with [Ruby 2.3.3](https://www.ruby-lang.org/en/news/2016/11/21/ruby-2-3-3-released/).  

Library dependancies can be installed from the top level directory via:
```
bundle install
bundle update
```

From there it can be run with:
```
ruby bin/run.rb
```

## Api Reference
```
     api_v1_boards GET   /api/v1/boards(.:format)                                  api/v1/boards#index
      api_v1_board GET   /api/v1/boards/:id(.:format)                              api/v1/boards#show
      api_v1_users POST  /api/v1/users(.:format)                                   api/v1/users#create
       api_v1_user PATCH /api/v1/users/:id(.:format)                               api/v1/users#update
                   PUT   /api/v1/users/:id(.:format)                               api/v1/users#update
            api_v1 GET   /api/v1/users/:name(.:format)                             api/v1/users#show
api_v1_board_users POST  /api/v1/board_users(.:format)                             api/v1/board_users#create
                   GET   /api/v1/board_users/:user_id/:board_id(.:format)          api/v1/board_users#show
                   PATCH /api/v1/board_users/:user_id/:board_id(.:format)          api/v1/board_users#update
                   PATCH /api/v1/board_users/progress/:user_id/:board_id(.:format) api/v1/board_users#update_progress

```

## Licensing
[MIT](https://oss.ninja/mit?organization=Sebastian%20Royer) 
Copyright 2018 [Sebastian Royer](https://github.com/walkingalchemy) and [Lindsay Davis](https://github.com/L-A-Davis)


## Thanks to:
<a href="https://icons8.com">Icon pack by Icons8</a>
