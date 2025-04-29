# typed: strong

module AcmeAISDK
  module Internal
    module Type
      # @api private
      module RequestParameters
        # Options to specify HTTP behaviour for this request.
        sig { returns(AcmeAISDK::RequestOpts) }
        attr_accessor :request_options

        # @api private
        module Converter
          # @api private
          sig { params(params: T.anything).returns([T.anything, AcmeAISDK::Internal::AnyHash]) }
          def dump_request(params); end
        end
      end
    end
  end
end
