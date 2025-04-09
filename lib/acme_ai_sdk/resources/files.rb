# frozen_string_literal: true

module AcmeAISDK
  module Resources
    class Files
      # Upload a file for processing with AI. The file will be analyzed and made
      # searchable using natural language queries.
      #
      # @overload file_create(file:, description: nil, processing_options: nil, request_options: {})
      #
      # @param file [Pathname, StringIO]
      # @param description [String]
      # @param processing_options [AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions]
      # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [AcmeAISDK::Models::FileFileCreateResponse]
      #
      # @see AcmeAISDK::Models::FileFileCreateParams
      def file_create(params)
        parsed, options = AcmeAISDK::Models::FileFileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "files/",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: AcmeAISDK::Models::FileFileCreateResponse,
          options: options
        )
      end

      # Search for content within a processed file using natural language queries.
      # Returns relevant passages and their context.
      #
      # @overload file_search(file_id, query:, context_size: nil, include_metadata: nil, max_results: nil, request_options: {})
      #
      # @param file_id [String]
      # @param query [String]
      # @param context_size [Integer]
      # @param include_metadata [Boolean]
      # @param max_results [Integer]
      # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [AcmeAISDK::Models::FileFileSearchResponse]
      #
      # @see AcmeAISDK::Models::FileFileSearchParams
      def file_search(file_id, params)
        parsed, options = AcmeAISDK::Models::FileFileSearchParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["files/%1$s/search", file_id],
          query: parsed,
          model: AcmeAISDK::Models::FileFileSearchResponse,
          options: options
        )
      end

      # Retrieve the processing status of files. Can be filtered by status and sorted by
      # upload time.
      #
      # @overload fileslist(limit: nil, offset: nil, sort_by: nil, sort_order: nil, status: nil, request_options: {})
      #
      # @param limit [Integer]
      # @param offset [Integer]
      # @param sort_by [Symbol, AcmeAISDK::Models::FileFileslistParams::SortBy]
      # @param sort_order [Symbol, AcmeAISDK::Models::FileFileslistParams::SortOrder]
      # @param status [Symbol, AcmeAISDK::Models::FileFileslistParams::Status]
      # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [AcmeAISDK::Models::FileFileslistResponse]
      #
      # @see AcmeAISDK::Models::FileFileslistParams
      def fileslist(params = {})
        parsed, options = AcmeAISDK::Models::FileFileslistParams.dump_request(params)
        @client.request(
          method: :get,
          path: "files/",
          query: parsed,
          model: AcmeAISDK::Models::FileFileslistResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [AcmeAISDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
