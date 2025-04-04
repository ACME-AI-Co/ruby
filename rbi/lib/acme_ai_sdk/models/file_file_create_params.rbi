# typed: strong

module AcmeAISDK
  module Models
    class FileFileCreateParams < AcmeAISDK::Internal::Type::BaseModel
      extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      # The file to upload
      sig { returns(T.any(IO, StringIO)) }
      attr_accessor :file

      # Optional description of the file
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions)) }
      attr_reader :processing_options

      sig do
        params(
          processing_options: T.any(AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions, AcmeAISDK::Internal::AnyHash)
        )
          .void
      end
      attr_writer :processing_options

      sig do
        params(
          file: T.any(IO, StringIO),
          description: String,
          processing_options: T.any(AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions, AcmeAISDK::Internal::AnyHash),
          request_options: T.any(AcmeAISDK::RequestOptions, AcmeAISDK::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(file:, description: nil, processing_options: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              file: T.any(IO, StringIO),
              description: String,
              processing_options: AcmeAISDK::Models::FileFileCreateParams::ProcessingOptions,
              request_options: AcmeAISDK::RequestOptions
            }
          )
      end
      def to_hash
      end

      class ProcessingOptions < AcmeAISDK::Internal::Type::BaseModel
        # Preferred language for processing
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Enable OCR for image-based documents
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :ocr

        sig { params(ocr: T::Boolean).void }
        attr_writer :ocr

        sig { params(language: String, ocr: T::Boolean).returns(T.attached_class) }
        def self.new(language: nil, ocr: nil)
        end

        sig { override.returns({language: String, ocr: T::Boolean}) }
        def to_hash
        end
      end
    end
  end
end
