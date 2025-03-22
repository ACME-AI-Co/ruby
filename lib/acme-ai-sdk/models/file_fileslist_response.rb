# frozen_string_literal: true

module AcmeAISDK
  module Models
    class FileFileslistResponse < AcmeAISDK::BaseModel
      # @!attribute [r] files
      #
      #   @return [Array<AcmeAISDK::Models::FileFileslistResponse::File>, nil]
      optional :files, -> { AcmeAISDK::ArrayOf[AcmeAISDK::Models::FileFileslistResponse::File] }

      # @!parse
      #   # @return [Array<AcmeAISDK::Models::FileFileslistResponse::File>]
      #   attr_writer :files

      # @!attribute [r] limit
      #   Maximum number of files returned
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :limit

      # @!attribute [r] offset
      #   Number of files skipped
      #
      #   @return [Integer, nil]
      optional :offset, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :offset

      # @!attribute [r] total
      #   Total number of files matching the filter
      #
      #   @return [Integer, nil]
      optional :total, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :total

      # @!parse
      #   # @param files [Array<AcmeAISDK::Models::FileFileslistResponse::File>]
      #   # @param limit [Integer]
      #   # @param offset [Integer]
      #   # @param total [Integer]
      #   #
      #   def initialize(files: nil, limit: nil, offset: nil, total: nil, **) = super

      # def initialize: (Hash | AcmeAISDK::BaseModel) -> void

      class File < AcmeAISDK::BaseModel
        # @!attribute [r] completion_time
        #   Time processing was completed (if applicable)
        #
        #   @return [Time, nil]
        optional :completion_time, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :completion_time

        # @!attribute [r] error
        #   Error message (if status is 'failed')
        #
        #   @return [String, nil]
        optional :error, String

        # @!parse
        #   # @return [String]
        #   attr_writer :error

        # @!attribute [r] file_id
        #   Unique identifier for the file
        #
        #   @return [String, nil]
        optional :file_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :file_id

        # @!attribute [r] file_size
        #   Size of the file in bytes
        #
        #   @return [Integer, nil]
        optional :file_size, Integer

        # @!parse
        #   # @return [Integer]
        #   attr_writer :file_size

        # @!attribute [r] filename
        #   Original name of the file
        #
        #   @return [String, nil]
        optional :filename, String

        # @!parse
        #   # @return [String]
        #   attr_writer :filename

        # @!attribute [r] status
        #   Current processing status
        #
        #   @return [Symbol, AcmeAISDK::Models::FileFileslistResponse::File::Status, nil]
        optional :status, enum: -> { AcmeAISDK::Models::FileFileslistResponse::File::Status }

        # @!parse
        #   # @return [Symbol, AcmeAISDK::Models::FileFileslistResponse::File::Status]
        #   attr_writer :status

        # @!attribute [r] upload_time
        #   Time the file was uploaded
        #
        #   @return [Time, nil]
        optional :upload_time, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :upload_time

        # @!parse
        #   # @param completion_time [Time]
        #   # @param error [String]
        #   # @param file_id [String]
        #   # @param file_size [Integer]
        #   # @param filename [String]
        #   # @param status [Symbol, AcmeAISDK::Models::FileFileslistResponse::File::Status]
        #   # @param upload_time [Time]
        #   #
        #   def initialize(
        #     completion_time: nil,
        #     error: nil,
        #     file_id: nil,
        #     file_size: nil,
        #     filename: nil,
        #     status: nil,
        #     upload_time: nil,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | AcmeAISDK::BaseModel) -> void

        # Current processing status
        module Status
          extend AcmeAISDK::Enum

          PENDING = :pending
          PROCESSING = :processing
          COMPLETED = :completed
          FAILED = :failed

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
