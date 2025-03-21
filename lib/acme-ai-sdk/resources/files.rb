# frozen_string_literal: true

module AcmeAISDK
  module Resources
    class Files
      # Upload a file for processing with AI. The file will be analyzed and made
      #   searchable using natural language queries.
      #
      # @param params [AcmeAISDK::Models::FileFileCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [IO, StringIO] :file The file to upload
      #
      #   @option params [String] :description Optional description of the file
      #
      #   @option params [AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions] :processing_options
      #
      #   @option params [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [AcmeAISDK::Models::FileFileCreateResponse]
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
      #   Returns relevant passages and their context.
      #
      # @param file_id [String] Unique identifier of the file to search in
      #
      # @param params [AcmeAISDK::Models::FileFileSearchParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :query Natural language search query
      #
      #   @option params [Integer] :context_size Number of characters to include before and after the match
      #
      #   @option params [Boolean] :include_metadata Whether to include file metadata in response
      #
      #   @option params [Integer] :max_results Maximum number of results to return
      #
      #   @option params [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [AcmeAISDK::Models::FileFileSearchResponse]
      def file_search(file_id, params)
        parsed, options = AcmeAISDK::Models::FileFileSearchParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["files/%0s/search", file_id],
          query: parsed,
          model: AcmeAISDK::Models::FileFileSearchResponse,
          options: options
        )
      end

      # Retrieve the processing status of files. Can be filtered by status and sorted by
      #   upload time.
      #
      # @param params [AcmeAISDK::Models::FileFileslistParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Integer] :limit Maximum number of files to return
      #
      #   @option params [Integer] :offset Number of files to skip
      #
      #   @option params [Symbol, AcmeAISDK::Models::FileFileslistParams::SortBy] :sort_by Field to sort by
      #
      #   @option params [Symbol, AcmeAISDK::Models::FileFileslistParams::SortOrder] :sort_order Sort order
      #
      #   @option params [Symbol, AcmeAISDK::Models::FileFileslistParams::Status] :status Filter by processing status
      #
      #   @option params [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [AcmeAISDK::Models::FileFileslistResponse]
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

      # @param client [AcmeAISDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
