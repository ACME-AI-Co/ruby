# typed: strong

module AcmeAISDK
  module Type
    # @api private
    #
    # Hash of items of a given type.
    class HashOf
      include AcmeAISDK::Type::Converter

      abstract!
      final!

      Elem = type_member(:out)

      sig(:final) do
        params(
          type_info: T.any(
            AcmeAISDK::Util::AnyHash,
            T.proc.returns(AcmeAISDK::Type::Converter::Input),
            AcmeAISDK::Type::Converter::Input
          ),
          spec: AcmeAISDK::Util::AnyHash
        )
          .returns(T.attached_class)
      end
      def self.[](type_info, spec = {})
      end

      sig(:final) { params(other: T.anything).returns(T::Boolean) }
      def ===(other)
      end

      sig(:final) { params(other: T.anything).returns(T::Boolean) }
      def ==(other)
      end

      # @api private
      sig(:final) do
        override
          .params(
            value: T.any(T::Hash[T.anything, T.anything], T.anything),
            state: AcmeAISDK::Type::Converter::State
          )
          .returns(T.any(AcmeAISDK::Util::AnyHash, T.anything))
      end
      def coerce(value, state:)
      end

      # @api private
      sig(:final) do
        override
          .params(value: T.any(T::Hash[T.anything, T.anything], T.anything))
          .returns(T.any(AcmeAISDK::Util::AnyHash, T.anything))
      end
      def dump(value)
      end

      # @api private
      sig(:final) { returns(Elem) }
      protected def item_type
      end

      # @api private
      sig(:final) { returns(T::Boolean) }
      protected def nilable?
      end

      # @api private
      sig(:final) do
        params(
          type_info: T.any(
            AcmeAISDK::Util::AnyHash,
            T.proc.returns(AcmeAISDK::Type::Converter::Input),
            AcmeAISDK::Type::Converter::Input
          ),
          spec: AcmeAISDK::Util::AnyHash
        )
          .void
      end
      def initialize(type_info, spec = {})
      end
    end
  end
end
