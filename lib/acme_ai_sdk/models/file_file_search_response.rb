# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_search
    class FileFileSearchResponse < AcmeAISDK::Internal::Type::BaseModel
      # @!attribute file_id
      #   Unique identifier of the searched file
      #
      #   @return [String, nil]
      optional :file_id, String

      # @!attribute metadata
      #   File metadata (only included if requested)
      #
      #   @return [AcmeAISDK::Models::FileFileSearchResponse::Metadata, nil]
      optional :metadata, -> { AcmeAISDK::Models::FileFileSearchResponse::Metadata }

      # @!attribute query
      #   The search query used
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute results
      #
      #   @return [Array<AcmeAISDK::Models::FileFileSearchResponse::Result>, nil]
      optional :results,
               -> { AcmeAISDK::Internal::Type::ArrayOf[AcmeAISDK::Models::FileFileSearchResponse::Result] }

      # @!attribute total_results
      #   Total number of results found
      #
      #   @return [Integer, nil]
      optional :total_results, Integer

      # @!method initialize(file_id: nil, metadata: nil, query: nil, results: nil, total_results: nil)
      #   @param file_id [String] Unique identifier of the searched file
      #
      #   @param metadata [AcmeAISDK::Models::FileFileSearchResponse::Metadata] File metadata (only included if requested)
      #
      #   @param query [String] The search query used
      #
      #   @param results [Array<AcmeAISDK::Models::FileFileSearchResponse::Result>]
      #
      #   @param total_results [Integer] Total number of results found

      # @see AcmeAISDK::Models::FileFileSearchResponse#metadata
      class Metadata < AcmeAISDK::Internal::Type::BaseModel
        # @!attribute description
        #   User-provided description of the file
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute file_id
        #   Unique identifier for the file
        #
        #   @return [String, nil]
        optional :file_id, String

        # @!attribute file_type
        #   MIME type of the file
        #
        #   @return [String, nil]
        optional :file_type, String

        # @!attribute filename
        #   Original name of the file
        #
        #   @return [String, nil]
        optional :filename, String

        # @!attribute page_count
        #   Number of pages (for documents)
        #
        #   @return [Integer, nil]
        optional :page_count, Integer

        # @!attribute processing_options
        #
        #   @return [AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions, nil]
        optional :processing_options,
                 -> { AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions }

        # @!attribute upload_time
        #   Time the file was uploaded
        #
        #   @return [Time, nil]
        optional :upload_time, Time

        # @!attribute word_count
        #   Approximate word count
        #
        #   @return [Integer, nil]
        optional :word_count, Integer

        # @!method initialize(description: nil, file_id: nil, file_type: nil, filename: nil, page_count: nil, processing_options: nil, upload_time: nil, word_count: nil)
        #   File metadata (only included if requested)
        #
        #   @param description [String] User-provided description of the file
        #
        #   @param file_id [String] Unique identifier for the file
        #
        #   @param file_type [String] MIME type of the file
        #
        #   @param filename [String] Original name of the file
        #
        #   @param page_count [Integer] Number of pages (for documents)
        #
        #   @param processing_options [AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions]
        #
        #   @param upload_time [Time] Time the file was uploaded
        #
        #   @param word_count [Integer] Approximate word count

        # @see AcmeAISDK::Models::FileFileSearchResponse::Metadata#processing_options
        class ProcessingOptions < AcmeAISDK::Internal::Type::BaseModel
          # @!attribute language
          #   Language used for processing
          #
          #   @return [String, nil]
          optional :language, String

          # @!attribute ocr
          #   Whether OCR was used
          #
          #   @return [Boolean, nil]
          optional :ocr, AcmeAISDK::Internal::Type::Boolean

          # @!method initialize(language: nil, ocr: nil)
          #   @param language [String] Language used for processing
          #
          #   @param ocr [Boolean] Whether OCR was used
        end
      end

      class Result < AcmeAISDK::Internal::Type::BaseModel
        # @!attribute additional_context
        #   Additional context information (document-type specific)
        #
        #   @return [Object, nil]
        optional :additional_context, AcmeAISDK::Internal::Type::Unknown

        # @!attribute highlight_ranges
        #   Character ranges to highlight within the passage
        #
        #   @return [Array<AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange>, nil]
        optional :highlight_ranges,
                 -> { AcmeAISDK::Internal::Type::ArrayOf[AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange] }

        # @!attribute page_number
        #   Page number where the match was found (if applicable)
        #
        #   @return [Integer, nil]
        optional :page_number, Integer

        # @!attribute passage
        #   Text passage containing the match with surrounding context
        #
        #   @return [String, nil]
        optional :passage, String

        # @!attribute relevance_score
        #   Relevance score of the result (0-1)
        #
        #   @return [Float, nil]
        optional :relevance_score, Float

        # @!method initialize(additional_context: nil, highlight_ranges: nil, page_number: nil, passage: nil, relevance_score: nil)
        #   @param additional_context [Object] Additional context information (document-type specific)
        #
        #   @param highlight_ranges [Array<AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange>] Character ranges to highlight within the passage
        #
        #   @param page_number [Integer] Page number where the match was found (if applicable)
        #
        #   @param passage [String] Text passage containing the match with surrounding context
        #
        #   @param relevance_score [Float] Relevance score of the result (0-1)

        class HighlightRange < AcmeAISDK::Internal::Type::BaseModel
          # @!attribute end_
          #   End index of highlight in passage
          #
          #   @return [Integer, nil]
          optional :end_, Integer, api_name: :end

          # @!attribute start
          #   Start index of highlight in passage
          #
          #   @return [Integer, nil]
          optional :start, Integer

          # @!method initialize(end_: nil, start: nil)
          #   @param end_ [Integer] End index of highlight in passage
          #
          #   @param start [Integer] Start index of highlight in passage
        end
      end
    end
  end
end
