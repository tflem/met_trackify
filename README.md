![Met Trackify workflow](https://github.com/tflem/met_trackify/actions/workflows/mettrackify.yml/badge.svg)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)
[![Maintainability](https://api.codeclimate.com/v1/badges/ed991bc332c2bac4e713/maintainability)](https://codeclimate.com/github/tflem/met_trackify/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/ed991bc332c2bac4e713/test_coverage)](https://codeclimate.com/github/tflem/met_trackify/test_coverage)

# Met Trackify

> This a product-tracking application, which features the following tools:

* Continuous Deployment: Heroku
* Ruby on Rails 6.1.7
* Ruby 3.1.2
* HTML5 and Sass
* PostgreSQL (Tested for 14.x)
* Testing Framework: RSpec 5.1.2
* CSS Framework: Semantic UI 2.4.4.0
* Continuous Integration: Github Actions

## Setup

How to run tests:

```
% rspec spec
```

How to run the development console:

```
% rails console
```

How to run the development server:

```
% rails server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% rails db:create

% rails db:migrate
```

You can view a staged demo at http://mettrackify.herokuapp.com.
