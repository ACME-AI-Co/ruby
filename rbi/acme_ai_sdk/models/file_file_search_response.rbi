# typed: strong

module AcmeAISDK
  module Models
    class FileFileSearchResponse < AcmeAISDK::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

      # Unique identifier of the searched file
      sig { returns(T.nilable(String)) }
      attr_reader :file_id

      sig { params(file_id: String).void }
      attr_writer :file_id

      # File metadata (only included if requested)
      sig do
        returns(T.nilable(AcmeAISDK::Models::FileFileSearchResponse::Metadata))
      end
      attr_reader :metadata

      sig do
        params(
          metadata: AcmeAISDK::Models::FileFileSearchResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # The search query used
      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      sig do
        returns(
          T.nilable(T::Array[AcmeAISDK::Models::FileFileSearchResponse::Result])
        )
      end
      attr_reader :results

      sig do
        params(
          results:
            T::Array[AcmeAISDK::Models::FileFileSearchResponse::Result::OrHash]
        ).void
      end
      attr_writer :results

      # Total number of results found
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_results

      sig { params(total_results: Integer).void }
      attr_writer :total_results

      sig do
        params(
          file_id: String,
          metadata: AcmeAISDK::Models::FileFileSearchResponse::Metadata::OrHash,
          query: String,
          results:
            T::Array[AcmeAISDK::Models::FileFileSearchResponse::Result::OrHash],
          total_results: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier of the searched file
        file_id: nil,
        # File metadata (only included if requested)
        metadata: nil,
        # The search query used
        query: nil,
        results: nil,
        # Total number of results found
        total_results: nil
      )
      end

      sig do
        override.returns(
          {
            file_id: String,
            metadata: AcmeAISDK::Models::FileFileSearchResponse::Metadata,
            query: String,
            results:
              T::Array[AcmeAISDK::Models::FileFileSearchResponse::Result],
            total_results: Integer
          }
        )
      end
      def to_hash
      end

      class Metadata < AcmeAISDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

        # User-provided description of the file
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Unique identifier for the file
        sig { returns(T.nilable(String)) }
        attr_reader :file_id

        sig { params(file_id: String).void }
        attr_writer :file_id

        # MIME type of the file
        sig { returns(T.nilable(String)) }
        attr_reader :file_type

        sig { params(file_type: String).void }
        attr_writer :file_type

        # Original name of the file
        sig { returns(T.nilable(String)) }
        attr_reader :filename

        sig { params(filename: String).void }
        attr_writer :filename

        # Number of pages (for documents)
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_count

        sig { params(page_count: Integer).void }
        attr_writer :page_count

        sig do
          returns(
            T.nilable(
              AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions
            )
          )
        end
        attr_reader :processing_options

        sig do
          params(
            processing_options:
              AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions::OrHash
          ).void
        end
        attr_writer :processing_options

        # Time the file was uploaded
        sig { returns(T.nilable(Time)) }
        attr_reader :upload_time

        sig { params(upload_time: Time).void }
        attr_writer :upload_time

        # Approximate word count
        sig { returns(T.nilable(Integer)) }
        attr_reader :word_count

        sig { params(word_count: Integer).void }
        attr_writer :word_count

        # File metadata (only included if requested)
        sig do
          params(
            description: String,
            file_id: String,
            file_type: String,
            filename: String,
            page_count: Integer,
            processing_options:
              AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions::OrHash,
            upload_time: Time,
            word_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # User-provided description of the file
          description: nil,
          # Unique identifier for the file
          file_id: nil,
          # MIME type of the file
          file_type: nil,
          # Original name of the file
          filename: nil,
          # Number of pages (for documents)
          page_count: nil,
          processing_options: nil,
          # Time the file was uploaded
          upload_time: nil,
          # Approximate word count
          word_count: nil
        )
        end

        sig do
          override.returns(
            {
              description: String,
              file_id: String,
              file_type: String,
              filename: String,
              page_count: Integer,
              processing_options:
                AcmeAISDK::Models::FileFileSearchResponse::Metadata::ProcessingOptions,
              upload_time: Time,
              word_count: Integer
            }
          )
        end
        def to_hash
        end

        class ProcessingOptions < AcmeAISDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

          # Language used for processing
          sig { returns(T.nilable(String)) }
          attr_reader :language

          sig { params(language: String).void }
          attr_writer :language

          # Whether OCR was used
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :ocr

          sig { params(ocr: T::Boolean).void }
          attr_writer :ocr

          sig do
            params(language: String, ocr: T::Boolean).returns(T.attached_class)
          end
          def self.new(
            # Language used for processing
            language: nil,
            # Whether OCR was used
            ocr: nil
          )
          end

          sig { override.returns({ language: String, ocr: T::Boolean }) }
          def to_hash
          end
        end
      end

      class Result < AcmeAISDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

        # Additional context information (document-type specific)
        sig { returns(T.nilable(T.anything)) }
        attr_reader :additional_context

        sig { params(additional_context: T.anything).void }
        attr_writer :additional_context

        # Character ranges to highlight within the passage
        sig do
          returns(
            T.nilable(
              T::Array[
                AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange
              ]
            )
          )
        end
        attr_reader :highlight_ranges

        sig do
          params(
            highlight_ranges:
              T::Array[
                AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange::OrHash
              ]
          ).void
        end
        attr_writer :highlight_ranges

        # Page number where the match was found (if applicable)
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_number

        sig { params(page_number: Integer).void }
        attr_writer :page_number

        # Text passage containing the match with surrounding context
        sig { returns(T.nilable(String)) }
        attr_reader :passage

        sig { params(passage: String).void }
        attr_writer :passage

        # Relevance score of the result (0-1)
        sig { returns(T.nilable(Float)) }
        attr_reader :relevance_score

        sig { params(relevance_score: Float).void }
        attr_writer :relevance_score

        sig do
          params(
            additional_context: T.anything,
            highlight_ranges:
              T::Array[
                AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange::OrHash
              ],
            page_number: Integer,
            passage: String,
            relevance_score: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional context information (document-type specific)
          additional_context: nil,
          # Character ranges to highlight within the passage
          highlight_ranges: nil,
          # Page number where the match was found (if applicable)
          page_number: nil,
          # Text passage containing the match with surrounding context
          passage: nil,
          # Relevance score of the result (0-1)
          relevance_score: nil
        )
        end

        sig do
          override.returns(
            {
              additional_context: T.anything,
              highlight_ranges:
                T::Array[
                  AcmeAISDK::Models::FileFileSearchResponse::Result::HighlightRange
                ],
              page_number: Integer,
              passage: String,
              relevance_score: Float
            }
          )
        end
        def to_hash
        end

        class HighlightRange < AcmeAISDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

          # End index of highlight in passage
          sig { returns(T.nilable(Integer)) }
          attr_reader :end_

          sig { params(end_: Integer).void }
          attr_writer :end_

          # Start index of highlight in passage
          sig { returns(T.nilable(Integer)) }
          attr_reader :start

          sig { params(start: Integer).void }
          attr_writer :start

          sig do
            params(end_: Integer, start: Integer).returns(T.attached_class)
          end
          def self.new(
            # End index of highlight in passage
            end_: nil,
            # Start index of highlight in passage
            start: nil
          )
          end

          sig { override.returns({ end_: Integer, start: Integer }) }
          def to_hash
          end
        end
      end
    end
  end
end
