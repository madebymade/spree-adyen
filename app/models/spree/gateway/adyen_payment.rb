module Spree
  class Gateway::AdyenPayment < Gateway
    include AdyenCommon

    def auto_capture?
      false
    end

    def payment_profiles_supported?
      true
    end

    def authorize(amount, source, gateway_options = {})
      card = { :holder_name => source.name,
               :number => source.number,
               :cvc => source.verification_value,
               :expiry_month => source.month,
               :expiry_year => source.year }

      authorize_on_card(amount, source, gateway_options, card)
    end
  end
end
