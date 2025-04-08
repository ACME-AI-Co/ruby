# typed: strong

module AcmeAISDK
  module Models
    class FileFileCreateResponse < AcmeAISDK::Internal::Type::BaseModel
      # Unique identifier for the file
      sig { returns(T.nilable(String)) }
      attr_reader :file_id

      sig { params(file_id: String).void }
      attr_writer :file_id

      # Current processing status
      sig { returns(T.nilable(AcmeAISDK::Models::FileFileCreateResponse::Status::TaggedSymbol)) }
      attr_reader :status

      sig { params(status: AcmeAISDK::Models::FileFileCreateResponse::Status::OrSymbol).void }
      attr_writer :status

      # Time the file was uploaded
      sig { returns(T.nilable(Time)) }
      attr_reader :upload_time

      sig { params(upload_time: Time).void }
      attr_writer :upload_time

      sig do
        params(
          file_id: String,
          status: AcmeAISDK::Models::FileFileCreateResponse::Status::OrSymbol,
          upload_time: Time
        )
          .returns(T.attached_class)
      end
      def self.new(file_id: nil, status: nil, upload_time: nil); end

      sig do
        override
          .returns(
            {file_id: String, status: AcmeAISDK::Models::FileFileCreateResponse::Status::TaggedSymbol, upload_time: Time}
          )
      end
      def to_hash; end

      # Current processing status
      module Status
        extend AcmeAISDK::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, AcmeAISDK::Models::FileFileCreateResponse::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, AcmeAISDK::Models::FileFileCreateResponse::Status::TaggedSymbol) }

        PENDING = T.let(:pending, AcmeAISDK::Models::FileFileCreateResponse::Status::TaggedSymbol)
        PROCESSING = T.let(:processing, AcmeAISDK::Models::FileFileCreateResponse::Status::TaggedSymbol)

        sig { override.returns(T::Array[AcmeAISDK::Models::FileFileCreateResponse::Status::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
