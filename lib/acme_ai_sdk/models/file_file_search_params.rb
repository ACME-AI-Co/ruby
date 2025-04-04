# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_search
    class FileFileSearchParams < AcmeAISDK::BaseModel
      # @!parse
      #   extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      # @!attribute query
      #   Natural language search query
      #
      #   @return [String]
      required :query, String

      # @!attribute [r] context_size
      #   Number of characters to include before and after the match
      #
      #   @return [Integer, nil]
      optional :context_size, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :context_size

      # @!attribute [r] include_metadata
      #   Whether to include file metadata in response
      #
      #   @return [Boolean, nil]
      optional :include_metadata, AcmeAISDK::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :include_metadata

      # @!attribute [r] max_results
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :max_results, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :max_results

      # @!parse
      #   # @param query [String]
      #   # @param context_size [Integer]
      #   # @param include_metadata [Boolean]
      #   # @param max_results [Integer]
      #   # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(query:, context_size: nil, include_metadata: nil, max_results: nil, request_options: {}, **) = super

      # def initialize: (Hash | AcmeAISDK::BaseModel) -> void
    end
  end
end
