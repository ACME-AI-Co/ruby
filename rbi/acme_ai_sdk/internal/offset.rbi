# typed: strong

module AcmeAISDK
  module Internal
    class Offset
      include AcmeAISDK::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :files

      sig { returns(Integer) }
      attr_accessor :total

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
