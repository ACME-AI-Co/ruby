# frozen_string_literal: true

module AcmeAISDK
  module Internal
    OMIT =
      Object.new.tap do
        _1.define_singleton_method(:inspect) { "#<#{AcmeAISDK::Internal}::OMIT>" }
      end
        .freeze
  end
end
