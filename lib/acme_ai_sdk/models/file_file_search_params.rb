# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_search
    class FileFileSearchParams < AcmeAISDK::Internal::Type::BaseModel
      extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      # @!attribute query
      #   Natural language search query
      #
      #   @return [String]
      required :query, String

      # @!attribute context_size
      #   Number of characters to include before and after the match
      #
      #   @return [Integer, nil]
      optional :context_size, Integer

      # @!attribute include_metadata
      #   Whether to include file metadata in response
      #
      #   @return [Boolean, nil]
      optional :include_metadata, AcmeAISDK::Internal::Type::Boolean

      # @!attribute max_results
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :max_results, Integer

      # @!method initialize(query:, context_size: nil, include_metadata: nil, max_results: nil, request_options: {})
      #   @param query [String] Natural language search query
      #
      #   @param context_size [Integer] Number of characters to include before and after the match
      #
      #   @param include_metadata [Boolean] Whether to include file metadata in response
      #
      #   @param max_results [Integer] Maximum number of results to return
      #
      #   @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
