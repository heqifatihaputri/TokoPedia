Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_LKDzCsEwekIqKLear1qql8qo'],
  :secret_key      => ENV['sk_test_QxRSGkjGBDLQXdT4bd9YPSiR']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]