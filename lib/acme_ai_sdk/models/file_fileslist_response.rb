# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#fileslist
    class FileFileslistResponse < AcmeAISDK::Internal::Type::BaseModel
      # @!attribute files
      #
      #   @return [Array<AcmeAISDK::Models::FileFileslistResponse::File>, nil]
      optional :files, -> { AcmeAISDK::Internal::Type::ArrayOf[AcmeAISDK::Models::FileFileslistResponse::File] }

      # @!attribute limit
      #   Maximum number of files returned
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute offset
      #   Number of files skipped
      #
      #   @return [Integer, nil]
      optional :offset, Integer

      # @!attribute total
      #   Total number of files matching the filter
      #
      #   @return [Integer, nil]
      optional :total, Integer

      # @!method initialize(files: nil, limit: nil, offset: nil, total: nil)
      #   @param files [Array<AcmeAISDK::Models::FileFileslistResponse::File>]
      #   @param limit [Integer]
      #   @param offset [Integer]
      #   @param total [Integer]

      class File < AcmeAISDK::Internal::Type::BaseModel
        # @!attribute completion_time
        #   Time processing was completed (if applicable)
        #
        #   @return [Time, nil]
        optional :completion_time, Time

        # @!attribute error
        #   Error message (if status is 'failed')
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute file_id
        #   Unique identifier for the file
        #
        #   @return [String, nil]
        optional :file_id, String

        # @!attribute file_size
        #   Size of the file in bytes
        #
        #   @return [Integer, nil]
        optional :file_size, Integer

        # @!attribute filename
        #   Original name of the file
        #
        #   @return [String, nil]
        optional :filename, String

        # @!attribute status
        #   Current processing status
        #
        #   @return [Symbol, AcmeAISDK::Models::FileFileslistResponse::File::Status, nil]
        optional :status, enum: -> { AcmeAISDK::Models::FileFileslistResponse::File::Status }

        # @!attribute upload_time
        #   Time the file was uploaded
        #
        #   @return [Time, nil]
        optional :upload_time, Time

        # @!method initialize(completion_time: nil, error: nil, file_id: nil, file_size: nil, filename: nil, status: nil, upload_time: nil)
        #   @param completion_time [Time]
        #   @param error [String]
        #   @param file_id [String]
        #   @param file_size [Integer]
        #   @param filename [String]
        #   @param status [Symbol, AcmeAISDK::Models::FileFileslistResponse::File::Status]
        #   @param upload_time [Time]

        # Current processing status
        #
        # @see AcmeAISDK::Models::FileFileslistResponse::File#status
        module Status
          extend AcmeAISDK::Internal::Type::Enum

          PENDING = :pending
          PROCESSING = :processing
          COMPLETED = :completed
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
