module Spree
  class Gateway::AdyenPaymentEncrypted < Gateway
    include AdyenCommon

    preference :public_key, :string

    def auto_capture?
      false
    end

    def method_type
      'adyen_encrypted'
    end

    def payment_profiles_supported?
      true
    end

    def authorize(amount, source, gateway_options = {})
      card = { encrypted: { json: source.encrypted_data } }
      authorize_on_card(amount, source, gateway_options, card)
    end
  end
end
