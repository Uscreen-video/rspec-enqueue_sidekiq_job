require File.expand_path('lib/rspec/enqueue_sidekiq_job/version', __dir__)

Gem::Specification.new do |s|
  s.name        = 'rspec-enqueue_sidekiq_job'
  s.version     = RSpec::EnqueuedSidekiqJob::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Phil Pirozhkov'
  s.email       = 'hello@fili.pp.ru'
  s.homepage    = 'http://github.com/pirj/rspec-enqueue_sidekiq_job'
  s.summary     = 'RSpec matcher to check enqueueing of Sidekiq jobs'
  s.description = s.summary
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.4.0'

  s.add_dependency 'rspec-core', '~> 3'
  s.add_dependency 'rspec-expectations', '~> 3'
  s.add_dependency 'sidekiq', '>= 2.4.0'

  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'

  s.files = %w[LICENSE README.md rspec-enqueue_sidekiq_job.gemspec] + Dir['**/*.rb']
  s.require_paths = ['lib']
end
