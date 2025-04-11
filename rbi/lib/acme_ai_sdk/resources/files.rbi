# typed: strong

module AcmeAISDK
  module Resources
    class Files
      # Upload a file for processing with AI. The file will be analyzed and made
      # searchable using natural language queries.
      sig do
        params(
          file: T.any(Pathname, StringIO),
          description: String,
          processing_options: T.any(AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions, AcmeAISDK::Internal::AnyHash),
          request_options: T.nilable(T.any(AcmeAISDK::RequestOptions, AcmeAISDK::Internal::AnyHash))
        )
          .returns(AcmeAISDK::Models::FileFileCreateResponse)
      end
      def file_create(
        # The file to upload
        file:,
        # Optional description of the file
        description: nil,
        processing_options: nil,
        request_options: {}
      ); end
      # Search for content within a processed file using natural language queries.
      # Returns relevant passages and their context.
      sig do
        params(
          file_id: String,
          query: String,
          context_size: Integer,
          include_metadata: T::Boolean,
          max_results: Integer,
          request_options: T.nilable(T.any(AcmeAISDK::RequestOptions, AcmeAISDK::Internal::AnyHash))
        )
          .returns(AcmeAISDK::Models::FileFileSearchResponse)
      end
      def file_search(
        # Unique identifier of the file to search in
        file_id,
        # Natural language search query
        query:,
        # Number of characters to include before and after the match
        context_size: nil,
        # Whether to include file metadata in response
        include_metadata: nil,
        # Maximum number of results to return
        max_results: nil,
        request_options: {}
      ); end
      # Retrieve the processing status of files. Can be filtered by status and sorted by
      # upload time.
      sig do
        params(
          limit: Integer,
          offset: Integer,
          sort_by: AcmeAISDK::Models::FileFileslistParams::SortBy::OrSymbol,
          sort_order: AcmeAISDK::Models::FileFileslistParams::SortOrder::OrSymbol,
          status: AcmeAISDK::Models::FileFileslistParams::Status::OrSymbol,
          request_options: T.nilable(T.any(AcmeAISDK::RequestOptions, AcmeAISDK::Internal::AnyHash))
        )
          .returns(AcmeAISDK::Models::FileFileslistResponse)
      end
      def fileslist(
        # Maximum number of files to return
        limit: nil,
        # Number of files to skip
        offset: nil,
        # Field to sort by
        sort_by: nil,
        # Sort order
        sort_order: nil,
        # Filter by processing status
        status: nil,
        request_options: {}
      ); end
      # @api private
      sig { params(client: AcmeAISDK::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
