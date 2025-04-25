# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_create
    class FileFileCreateResponse < AcmeAISDK::Internal::Type::BaseModel
      # @!attribute file_id
      #   Unique identifier for the file
      #
      #   @return [String, nil]
      optional :file_id, String

      # @!attribute status
      #   Current processing status
      #
      #   @return [Symbol, AcmeAISDK::Models::FileFileCreateResponse::Status, nil]
      optional :status, enum: -> { AcmeAISDK::Models::FileFileCreateResponse::Status }

      # @!attribute upload_time
      #   Time the file was uploaded
      #
      #   @return [Time, nil]
      optional :upload_time, Time

      # @!method initialize(file_id: nil, status: nil, upload_time: nil)
      #   @param file_id [String] Unique identifier for the file
      #
      #   @param status [Symbol, AcmeAISDK::Models::FileFileCreateResponse::Status] Current processing status
      #
      #   @param upload_time [Time] Time the file was uploaded

      # Current processing status
      #
      # @see AcmeAISDK::Models::FileFileCreateResponse#status
      module Status
        extend AcmeAISDK::Internal::Type::Enum

        PENDING = :pending
        PROCESSING = :processing

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
