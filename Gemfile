source "https://rubygems.org"

gemspec

gem "rake"
gem "redis-namespace"
gem "rails", ">= 6.0.2"
gem "sqlite3", platforms: :ruby
gem "activerecord-jdbcsqlite3-adapter", platforms: :jruby
gem 'rdl', path: "~/Documents/works/type-infer/rdl" #git: 'https://github.com/plum-umd/rdl.git', branch: 'infer'


group :test do
  gem "minitest"
  gem "simplecov"
end

group :development, :test do
  gem "pry-byebug", platforms: :mri
  gem "standard"
end

group :load_test do
  gem "hiredis"
  gem "toxiproxy"
end
