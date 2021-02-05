# views_schema
A set of tasks to build/maintain views


## Requirements

* Rails: This gem installs Rake tasks and class definitions to be used in a Rails application.

## Setup

Add this gem to the project

```
  gem 'views_schema', github: 'sanger/views_schema', branch: 'main'
```

## Usage

### Creating new views

1. Generate a migration for the project

For example: 
```
  bundle exec rails generate migration AddCherrypickedSamplesView
```

2. Inside the migrating method include the following call to create a view:

For example:
```
class AddCherrypickedSamplesView < ActiveRecord::Migration[6.0]
  def up
    VIEW_NAME='MyViewName'
    ViewsSchema.create_view(
      VIEW_NAME,
      <<~SQL.squish
        SELECT name, address
        FROM address_book;
      SQL
    )
  end
end
```

3. Run the migration that will create the views

```
  bundle exec rake db:migrate
```

### Dump the schema of views

1. Run the rake task
```
  bundle exec rake db:views:schema:dump
```

This will generate a file ```db/views_schema.rb```.


### Load the schema of views

1. Run the rake task
```
  bundle exec rake db:views:schema:load
```

This will load the views schema from file ```db/views_schema.rb```.