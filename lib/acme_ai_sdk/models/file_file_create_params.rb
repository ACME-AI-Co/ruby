# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_create
    class FileFileCreateParams < AcmeAISDK::Internal::Type::BaseModel
      extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      # @!attribute file
      #   The file to upload
      #
      #   @return [Pathname, StringIO]
      required :file, AcmeAISDK::Internal::Type::IOLike

      # @!attribute description
      #   Optional description of the file
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute processing_options
      #
      #   @return [AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions, nil]
      optional :processing_options, -> { AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions }

      # @!method initialize(file:, description: nil, processing_options: nil, request_options: {})
      #   @param file [Pathname, StringIO]
      #   @param description [String]
      #   @param processing_options [AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions]
      #   @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}]

      class ProcessingOptions < AcmeAISDK::Internal::Type::BaseModel
        # @!attribute language
        #   Preferred language for processing
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute ocr
        #   Enable OCR for image-based documents
        #
        #   @return [Boolean, nil]
        optional :ocr, AcmeAISDK::Internal::Type::Boolean

        # @!method initialize(language: nil, ocr: nil)
        #   @param language [String]
        #   @param ocr [Boolean]
      end
    end
  end
end
