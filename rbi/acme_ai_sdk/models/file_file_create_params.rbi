# typed: strong

module AcmeAISDK
  module Models
    class FileFileCreateParams < AcmeAISDK::Internal::Type::BaseModel
      extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

      # The file to upload
      sig { returns(T.any(Pathname, StringIO, IO, AcmeAISDK::FilePart)) }
      attr_accessor :file

      # Optional description of the file
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        returns(T.nilable(AcmeAISDK::FileFileCreateParams::ProcessingOptions))
      end
      attr_reader :processing_options

      sig do
        params(
          processing_options:
            AcmeAISDK::FileFileCreateParams::ProcessingOptions::OrHash
        ).void
      end
      attr_writer :processing_options

      sig do
        params(
          file: T.any(Pathname, StringIO, IO, AcmeAISDK::FilePart),
          description: String,
          processing_options:
            AcmeAISDK::FileFileCreateParams::ProcessingOptions::OrHash,
          request_options: AcmeAISDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The file to upload
        file:,
        # Optional description of the file
        description: nil,
        processing_options: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file: T.any(Pathname, StringIO, IO, AcmeAISDK::FilePart),
            description: String,
            processing_options:
              AcmeAISDK::FileFileCreateParams::ProcessingOptions,
            request_options: AcmeAISDK::RequestOptions
          }
        )
      end
      def to_hash
      end

      class ProcessingOptions < AcmeAISDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

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

        sig do
          params(language: String, ocr: T::Boolean).returns(T.attached_class)
        end
        def self.new(
          # Preferred language for processing
          language: nil,
          # Enable OCR for image-based documents
          ocr: nil
        )
        end

        sig { override.returns({ language: String, ocr: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
