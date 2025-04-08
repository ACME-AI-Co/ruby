# typed: strong

module AcmeAISDK
  module Models
    class FileFileSearchParams < AcmeAISDK::Internal::Type::BaseModel
      extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      # Natural language search query
      sig { returns(String) }
      attr_accessor :query

      # Number of characters to include before and after the match
      sig { returns(T.nilable(Integer)) }
      attr_reader :context_size

      sig { params(context_size: Integer).void }
      attr_writer :context_size

      # Whether to include file metadata in response
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_metadata

      sig { params(include_metadata: T::Boolean).void }
      attr_writer :include_metadata

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_results

      sig { params(max_results: Integer).void }
      attr_writer :max_results

      sig do
        params(
          query: String,
          context_size: Integer,
          include_metadata: T::Boolean,
          max_results: Integer,
          request_options: T.any(AcmeAISDK::RequestOptions, AcmeAISDK::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(query:, context_size: nil, include_metadata: nil, max_results: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              query: String,
              context_size: Integer,
              include_metadata: T::Boolean,
              max_results: Integer,
              request_options: AcmeAISDK::RequestOptions
            }
          )
      end
      def to_hash; end
    end
  end
end
