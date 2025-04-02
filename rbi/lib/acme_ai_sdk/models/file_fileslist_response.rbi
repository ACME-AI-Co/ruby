# typed: strong

module AcmeAISDK
  module Models
    class FileFileslistResponse < AcmeAISDK::BaseModel
      sig { returns(T.nilable(T::Array[AcmeAISDK::Models::FileFileslistResponse::File])) }
      attr_reader :files

      sig do
        params(files: T::Array[T.any(AcmeAISDK::Models::FileFileslistResponse::File, AcmeAISDK::Util::AnyHash)])
          .void
      end
      attr_writer :files

      # Maximum number of files returned
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Number of files skipped
      sig { returns(T.nilable(Integer)) }
      attr_reader :offset

      sig { params(offset: Integer).void }
      attr_writer :offset

      # Total number of files matching the filter
      sig { returns(T.nilable(Integer)) }
      attr_reader :total

      sig { params(total: Integer).void }
      attr_writer :total

      sig do
        params(
          files: T::Array[T.any(AcmeAISDK::Models::FileFileslistResponse::File, AcmeAISDK::Util::AnyHash)],
          limit: Integer,
          offset: Integer,
          total: Integer
        )
          .returns(T.attached_class)
      end
      def self.new(files: nil, limit: nil, offset: nil, total: nil)
      end

      sig do
        override
          .returns(
            {files: T::Array[AcmeAISDK::Models::FileFileslistResponse::File], limit: Integer, offset: Integer, total: Integer}
          )
      end
      def to_hash
      end

      class File < AcmeAISDK::BaseModel
        # Time processing was completed (if applicable)
        sig { returns(T.nilable(Time)) }
        attr_reader :completion_time

        sig { params(completion_time: Time).void }
        attr_writer :completion_time

        # Error message (if status is 'failed')
        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # Unique identifier for the file
        sig { returns(T.nilable(String)) }
        attr_reader :file_id

        sig { params(file_id: String).void }
        attr_writer :file_id

        # Size of the file in bytes
        sig { returns(T.nilable(Integer)) }
        attr_reader :file_size

        sig { params(file_size: Integer).void }
        attr_writer :file_size

        # Original name of the file
        sig { returns(T.nilable(String)) }
        attr_reader :filename

        sig { params(filename: String).void }
        attr_writer :filename

        # Current processing status
        sig { returns(T.nilable(AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol)) }
        attr_reader :status

        sig { params(status: AcmeAISDK::Models::FileFileslistResponse::File::Status::OrSymbol).void }
        attr_writer :status

        # Time the file was uploaded
        sig { returns(T.nilable(Time)) }
        attr_reader :upload_time

        sig { params(upload_time: Time).void }
        attr_writer :upload_time

        sig do
          params(
            completion_time: Time,
            error: String,
            file_id: String,
            file_size: Integer,
            filename: String,
            status: AcmeAISDK::Models::FileFileslistResponse::File::Status::OrSymbol,
            upload_time: Time
          )
            .returns(T.attached_class)
        end
        def self.new(
          completion_time: nil,
          error: nil,
          file_id: nil,
          file_size: nil,
          filename: nil,
          status: nil,
          upload_time: nil
        )
        end

        sig do
          override
            .returns(
              {
                completion_time: Time,
                error: String,
                file_id: String,
                file_size: Integer,
                filename: String,
                status: AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol,
                upload_time: Time
              }
            )
        end
        def to_hash
        end

        # Current processing status
        module Status
          extend AcmeAISDK::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, AcmeAISDK::Models::FileFileslistResponse::File::Status) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol) }

          PENDING = T.let(:pending, AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol)
          PROCESSING = T.let(:processing, AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol)
          COMPLETED = T.let(:completed, AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol)
          FAILED = T.let(:failed, AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol)

          sig { override.returns(T::Array[AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
