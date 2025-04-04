# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_search
    class FileFileSearchResponse < AcmeAISDK::Internal::Type::BaseModel
      # @!attribute [r] file_id
      #   Unique identifier of the searched file
      #
      #   @return [String, nil]
      optional :file_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :file_id

      # @!attribute [r] metadata
      #   File metadata (only included if requested)
      #
      #   @return [AcmeAISDK::Models::FileFileSearchResponse::Metadata, nil]
      optional :metadata, -> { AcmeAISDK::Models::FileFileSearchResponse::Metadata }

      # @!parse
      #   # @return [AcmeAISDK::Models::FileFileSearchResponse::Metadata]
      #   attr_writer :metadata

      # @!attribute [r] query
      #   The search query used
      #
      #   @return [String, nil]
      optional :query, String

      # @!parse
      #   # @return [String]
      #   attr_writer :query

      # @!attribute [r] results
      #
      #   @return [Array<AcmeAISDK::Models::FileFileSearchResponse::Result>, nil]
      optional :results,
               -> { AcmeAISDK::Internal::Type::ArrayOf[AcmeAISDK::Models::FileFileSearchResponse::Result] }

      # @!parse
      #   # @return [Array<AcmeAISDK::Models::FileFileSearchResponse::Result>]
      #   attr_writer :results

      # @!attribute [r] total_results
      #   Total number of results found
      #
      #   @return [Integer, nil]
      optional :total_results, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :total_results

      # @!parse
      #   # @param file_id [String]
      #   # @param metadata [AcmeAISDK::Models::FileFileSearchResponse::Metadata]
      #   # @param query [String]
      #   # @param results [Array<AcmeAISDK::Models::FileFileSearchResponse::Result>]
      #   # @param total_results [Integer]
      #   #
      #   def initialize(file_id: nil, metadata: nil, query: nil, results: nil, total_results: nil, **) = super

      # def initialize: (Hash | AcmeAISDK::Internal::Type::BaseModel) -> void

      # @see AcmeAISDK::Models::FileFileSearchResponse#metadata
      class Metadata < AcmeAISDK::Internal::Type::BaseModel
        # @!attribute [r] description
        #   User-provided description of the file
        #
        #   @return [String, nil]
        optional :description, String

        # @!parse
        #   # @return [String]
        #   attr_writer :description

        # @!attribute [r] file_id
        #   Unique identifier for the file
        #
        #   @return [String, nil]
        optional :file_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :file_id

        # @!attribute [r] file_type
        #   MIME type of the file
        #
        #   @return [String, nil]
        optional :file_type, String

        # @!parse
        #   # @return [String]
        #   attr_writer :file_type

        # @!attribute [r] filename
        #   Original name of the file
        #
        #   @return [String, nil]
        optional :filename, String

        # @!parse
        #   # @return [String]
        #   attr_writer :filename

        # @!attribute [r] page_count
        #   Number of pages (for documents)
        #
        #   @return [Integer, nil]
        optional :page_count, Integer

        # @!parse
        #   # @return [Integer]
        #   attr_writer :page_count

        # @!attribute [r] processing_options
        #
        #   @return [AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions, nil]
        optional :processing_options,
                 -> { AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions }

        # @!parse
        #   # @return [AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions]
        #   attr_writer :processing_options

        # @!attribute [r] upload_time
        #   Time the file was uploaded
        #
        #   @return [Time, nil]
        optional :upload_time, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :upload_time

        # @!attribute [r] word_count
        #   Approximate word count
        #
        #   @return [Integer, nil]
        optional :word_count, Integer

        # @!parse
        #   # @return [Integer]
        #   attr_writer :word_count

        # @!parse
        #   # File metadata (only included if requested)
        #   #
        #   # @param description [String]
        #   # @param file_id [String]
        #   # @param file_type [String]
        #   # @param filename [String]
        #   # @param page_count [Integer]
        #   # @param processing_options [AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions]
        #   # @param upload_time [Time]
        #   # @param word_count [Integer]
        #   #
        #   def initialize(
        #     description: nil,
        #     file_id: nil,
        #     file_type: nil,
        #     filename: nil,
        #     page_count: nil,
        #     processing_options: nil,
        #     upload_time: nil,
        #     word_count: nil,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | AcmeAISDK::Internal::Type::BaseModel) -> void

        # @see AcmeAISDK::Models::FileFileSearchResponse::Metadata#processing_options
        class ProcessingOptions < AcmeAISDK::Internal::Type::BaseModel
          # @!attribute [r] language
          #   Language used for processing
          #
          #   @return [String, nil]
          optional :language, String

          # @!parse
          #   # @return [String]
          #   attr_writer :language

          # @!attribute [r] ocr
          #   Whether OCR was used
          #
          #   @return [Boolean, nil]
          optional :ocr, AcmeAISDK::Internal::Type::BooleanModel

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :ocr

          # @!parse
          #   # @param language [String]
          #   # @param ocr [Boolean]
          #   #
          #   def initialize(language: nil, ocr: nil, **) = super

          # def initialize: (Hash | AcmeAISDK::Internal::Type::BaseModel) -> void
        end
      end

      class Result < AcmeAISDK::Internal::Type::BaseModel
        # @!attribute [r] additional_context
        #   Additional context information (document-type specific)
        #
        #   @return [Object, nil]
        optional :additional_context, AcmeAISDK::Internal::Type::Unknown

        # @!parse
        #   # @return [Object]
        #   attr_writer :additional_context

        # @!attribute [r] highlight_ranges
        #   Character ranges to highlight within the passage
        #
        #   @return [Array<AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange>, nil]
        optional :highlight_ranges,
                 -> { AcmeAISDK::Internal::Type::ArrayOf[AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange] }

        # @!parse
        #   # @return [Array<AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange>]
        #   attr_writer :highlight_ranges

        # @!attribute [r] page_number
        #   Page number where the match was found (if applicable)
        #
        #   @return [Integer, nil]
        optional :page_number, Integer

        # @!parse
        #   # @return [Integer]
        #   attr_writer :page_number

        # @!attribute [r] passage
        #   Text passage containing the match with surrounding context
        #
        #   @return [String, nil]
        optional :passage, String

        # @!parse
        #   # @return [String]
        #   attr_writer :passage

        # @!attribute [r] relevance_score
        #   Relevance score of the result (0-1)
        #
        #   @return [Float, nil]
        optional :relevance_score, Float

        # @!parse
        #   # @return [Float]
        #   attr_writer :relevance_score

        # @!parse
        #   # @param additional_context [Object]
        #   # @param highlight_ranges [Array<AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange>]
        #   # @param page_number [Integer]
        #   # @param passage [String]
        #   # @param relevance_score [Float]
        #   #
        #   def initialize(additional_context: nil, highlight_ranges: nil, page_number: nil, passage: nil, relevance_score: nil, **) = super

        # def initialize: (Hash | AcmeAISDK::Internal::Type::BaseModel) -> void

        class HighlightRange < AcmeAISDK::Internal::Type::BaseModel
          # @!attribute [r] end_
          #   End index of highlight in passage
          #
          #   @return [Integer, nil]
          optional :end_, Integer, api_name: :end

          # @!parse
          #   # @return [Integer]
          #   attr_writer :end_

          # @!attribute [r] start
          #   Start index of highlight in passage
          #
          #   @return [Integer, nil]
          optional :start, Integer

          # @!parse
          #   # @return [Integer]
          #   attr_writer :start

          # @!parse
          #   # @param end_ [Integer]
          #   # @param start [Integer]
          #   #
          #   def initialize(end_: nil, start: nil, **) = super

          # def initialize: (Hash | AcmeAISDK::Internal::Type::BaseModel) -> void
        end
      end
    end
  end
end
