# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#fileslist
    class FileFileslistParams < AcmeAISDK::Internal::Type::BaseModel
      extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      # @!attribute limit
      #   Maximum number of files to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute offset
      #   Number of files to skip
      #
      #   @return [Integer, nil]
      optional :offset, Integer

      # @!attribute sort_by
      #   Field to sort by
      #
      #   @return [Symbol, AcmeAISDK::Models::FileFileslistParams::SortBy, nil]
      optional :sort_by, enum: -> { AcmeAISDK::Models::FileFileslistParams::SortBy }

      # @!attribute sort_order
      #   Sort order
      #
      #   @return [Symbol, AcmeAISDK::Models::FileFileslistParams::SortOrder, nil]
      optional :sort_order, enum: -> { AcmeAISDK::Models::FileFileslistParams::SortOrder }

      # @!attribute status
      #   Filter by processing status
      #
      #   @return [Symbol, AcmeAISDK::Models::FileFileslistParams::Status, nil]
      optional :status, enum: -> { AcmeAISDK::Models::FileFileslistParams::Status }

      # @!method initialize(limit: nil, offset: nil, sort_by: nil, sort_order: nil, status: nil, request_options: {})
      #   @param limit [Integer] Maximum number of files to return
      #
      #   @param offset [Integer] Number of files to skip
      #
      #   @param sort_by [Symbol, AcmeAISDK::Models::FileFileslistParams::SortBy] Field to sort by
      #
      #   @param sort_order [Symbol, AcmeAISDK::Models::FileFileslistParams::SortOrder] Sort order
      #
      #   @param status [Symbol, AcmeAISDK::Models::FileFileslistParams::Status] Filter by processing status
      #
      #   @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}]

      # Field to sort by
      module SortBy
        extend AcmeAISDK::Internal::Type::Enum

        UPLOAD_TIME = :upload_time
        STATUS = :status

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Sort order
      module SortOrder
        extend AcmeAISDK::Internal::Type::Enum

        ASC = :asc
        DESC = :desc

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by processing status
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
