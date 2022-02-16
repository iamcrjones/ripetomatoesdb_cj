Rails.configuration.stripe = {
    Stripe.setPublishableKey(:publishable_key => ENV['publishable_key']),
    :secret_key      => ENV['secret_key']
 }
 Stripe.api_key = Rails.configuration.stripe[:secret_key]