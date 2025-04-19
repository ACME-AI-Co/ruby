# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_create
    class FileFileCreateResponse < AcmeAISDK::Internal::Type::BaseModel
      # @!attribute [r] file_id
      #   Unique identifier for the file
      #
      #   @return [String, nil]
      optional :file_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :file_id

      # @!attribute [r] status
      #   Current processing status
      #
      #   @return [Symbol, AcmeAISDK::Models::FileFileCreateResponse::Status, nil]
      optional :status, enum: -> { AcmeAISDK::Models::FileFileCreateResponse::Status }

      # @!parse
      #   # @return [Symbol, AcmeAISDK::Models::FileFileCreateResponse::Status]
      #   attr_writer :status

      # @!attribute [r] upload_time
      #   Time the file was uploaded
      #
      #   @return [Time, nil]
      optional :upload_time, Time

      # @!parse
      #   # @return [Time]
      #   attr_writer :upload_time

      # @!method initialize(file_id: nil, status: nil, upload_time: nil)
      #   @param file_id [String]
      #   @param status [Symbol, AcmeAISDK::Models::FileFileCreateResponse::Status]
      #   @param upload_time [Time]

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
