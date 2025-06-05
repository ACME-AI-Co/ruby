# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#fileslist
    class FileFileslistResponse < AcmeAISDK::Internal::Type::BaseModel
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
      #   @return [Symbol, AcmeAISDK::Models::FileFileslistResponse::Status, nil]
      optional :status, enum: -> { AcmeAISDK::Models::FileFileslistResponse::Status }

      # @!attribute upload_time
      #   Time the file was uploaded
      #
      #   @return [Time, nil]
      optional :upload_time, Time

      # @!method initialize(completion_time: nil, error: nil, file_id: nil, file_size: nil, filename: nil, status: nil, upload_time: nil)
      #   @param completion_time [Time] Time processing was completed (if applicable)
      #
      #   @param error [String] Error message (if status is 'failed')
      #
      #   @param file_id [String] Unique identifier for the file
      #
      #   @param file_size [Integer] Size of the file in bytes
      #
      #   @param filename [String] Original name of the file
      #
      #   @param status [Symbol, AcmeAISDK::Models::FileFileslistResponse::Status] Current processing status
      #
      #   @param upload_time [Time] Time the file was uploaded

      # Current processing status
      #
      # @see AcmeAISDK::Models::FileFileslistResponse#status
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
