# frozen_string_literal: true

module AcmeAISDK
  module Models
    # @see AcmeAISDK::Resources::Files#file_create
    class FileFileCreateParams < AcmeAISDK::BaseModel
      # @!parse
      #   extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      # @!attribute file
      #   The file to upload
      #
      #   @return [IO, StringIO]
      required :file, IO

      # @!attribute [r] description
      #   Optional description of the file
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!attribute [r] processing_options
      #
      #   @return [AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions, nil]
      optional :processing_options, -> { AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions }

      # @!parse
      #   # @return [AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions]
      #   attr_writer :processing_options

      # @!parse
      #   # @param file [IO, StringIO]
      #   # @param description [String]
      #   # @param processing_options [AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions]
      #   # @param request_options [AcmeAISDK::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(file:, description: nil, processing_options: nil, request_options: {}, **) = super

      # def initialize: (Hash | AcmeAISDK::BaseModel) -> void

      class ProcessingOptions < AcmeAISDK::BaseModel
        # @!attribute [r] language
        #   Preferred language for processing
        #
        #   @return [String, nil]
        optional :language, String

        # @!parse
        #   # @return [String]
        #   attr_writer :language

        # @!attribute [r] ocr
        #   Enable OCR for image-based documents
        #
        #   @return [Boolean, nil]
        optional :ocr, AcmeAISDK::BooleanModel

        # @!parse
        #   # @return [Boolean]
        #   attr_writer :ocr

        # @!parse
        #   # @param language [String]
        #   # @param ocr [Boolean]
        #   #
        #   def initialize(language: nil, ocr: nil, **) = super

        # def initialize: (Hash | AcmeAISDK::BaseModel) -> void
      end
    end
  end
end
