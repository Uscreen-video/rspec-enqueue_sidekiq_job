# `enqueue_sidekiq_job` RSpec block matcher

## Installation

```ruby
# Gemfile
group :test do
  gem 'rspec-enqueue_sidekiq_job'
end
```

## Usage

Checks if a certain job was enqueued in a block.

```ruby
expect { AwesomeWorker.perform_async }
  .to enqueue_sidekiq_job(AwesomeWorker)
```

### Specifying arguments

```ruby
expect { AwesomeWorker.perform_async(42, 'David')
  .to enqueue_sidekiq_job(AwesomeWorker).with(42, 'David')
```

### Testing scheduled jobs

Use chainable matchers `#at` and `#in`:
```ruby
time = 5.minutes.from_now
expect { AwesomeWorker.perform_at(time) }
  .to enqueue_sidekiq_job(AwesomeWorker).at(time)
```
```ruby
interval = 5.minutes
expect { AwesomeWorker.perform_in(interval) }
  .to enqueue_sidekiq_job(AwesomeWorker).in(5.minutes)
```

### Specifying counts

`enqueue_sidekiq_job` implies "exactly once" by default. But you can adjust that.

```ruby
expect {
  2.times { AwesomeWorker.perform_async }
}.to enqueue_sidekiq_job(AwesomeWorker).twice
```

```ruby
expect {
  3.times { AwesomeWorker.perform_async }
}.to enqueue_sidekiq_job(AwesomeWorker).exactly(3).times
```
