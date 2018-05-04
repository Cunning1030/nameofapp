if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_jQDuhMrUKm3u5lru793Rgx2f',
    secret_key: 'sk_test_0jykWpDx4QyQU6KlMGdVft4M'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
