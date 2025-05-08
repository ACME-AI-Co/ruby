# frozen_string_literal: true

module AcmeAISDK
  module Resources
    class Files
      # Upload a file for processing with AI. The file will be analyzed and made
      # searchable using natural language queries.
      #
      # @overload file_create(file:, description: nil, processing_options: nil, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, AcmeAISDK::FilePart] The file to upload
      #
      # @param description [String] Optional description of the file
      #
      # @param processing_options [AcmeAISDK::FileFileCreateParams::ProcessingOptions]
      #
      # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [AcmeAISDK::Models::FileFileCreateResponse]
      #
      # @see AcmeAISDK::Models::FileFileCreateParams
      def file_create(params)
        parsed, options = AcmeAISDK::FileFileCreateParams.dump_request(params)
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
      # @param file_id [String] Unique identifier of the file to search in
      #
      # @param query [String] Natural language search query
      #
      # @param context_size [Integer] Number of characters to include before and after the match
      #
      # @param include_metadata [Boolean] Whether to include file metadata in response
      #
      # @param max_results [Integer] Maximum number of results to return
      #
      # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [AcmeAISDK::Models::FileFileSearchResponse]
      #
      # @see AcmeAISDK::Models::FileFileSearchParams
      def file_search(file_id, params)
        parsed, options = AcmeAISDK::FileFileSearchParams.dump_request(params)
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
      # @param limit [Integer] Maximum number of files to return
      #
      # @param offset [Integer] Number of files to skip
      #
      # @param sort_by [Symbol, AcmeAISDK::FileFileslistParams::SortBy] Field to sort by
      #
      # @param sort_order [Symbol, AcmeAISDK::FileFileslistParams::SortOrder] Sort order
      #
      # @param status [Symbol, AcmeAISDK::FileFileslistParams::Status] Filter by processing status
      #
      # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [AcmeAISDK::Models::FileFileslistResponse]
      #
      # @see AcmeAISDK::Models::FileFileslistParams
      def fileslist(params = {})
        parsed, options = AcmeAISDK::FileFileslistParams.dump_request(params)
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
