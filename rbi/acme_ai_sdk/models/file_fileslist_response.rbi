# typed: strong

module AcmeAISDK
  module Models
    class FileFileslistResponse < AcmeAISDK::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

      sig do
        returns(
          T.nilable(T::Array[AcmeAISDK::Models::FileFileslistResponse::File])
        )
      end
      attr_reader :files

      sig do
        params(
          files:
            T::Array[AcmeAISDK::Models::FileFileslistResponse::File::OrHash]
        ).void
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
          files:
            T::Array[AcmeAISDK::Models::FileFileslistResponse::File::OrHash],
          limit: Integer,
          offset: Integer,
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        files: nil,
        # Maximum number of files returned
        limit: nil,
        # Number of files skipped
        offset: nil,
        # Total number of files matching the filter
        total: nil
      )
      end

      sig do
        override.returns(
          {
            files: T::Array[AcmeAISDK::Models::FileFileslistResponse::File],
            limit: Integer,
            offset: Integer,
            total: Integer
          }
        )
      end
      def to_hash
      end

      class File < AcmeAISDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

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
        sig do
          returns(
            T.nilable(
              AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              AcmeAISDK::Models::FileFileslistResponse::File::Status::OrSymbol
          ).void
        end
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
            status:
              AcmeAISDK::Models::FileFileslistResponse::File::Status::OrSymbol,
            upload_time: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Time processing was completed (if applicable)
          completion_time: nil,
          # Error message (if status is 'failed')
          error: nil,
          # Unique identifier for the file
          file_id: nil,
          # Size of the file in bytes
          file_size: nil,
          # Original name of the file
          filename: nil,
          # Current processing status
          status: nil,
          # Time the file was uploaded
          upload_time: nil
        )
        end

        sig do
          override.returns(
            {
              completion_time: Time,
              error: String,
              file_id: String,
              file_size: Integer,
              filename: String,
              status:
                AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol,
              upload_time: Time
            }
          )
        end
        def to_hash
        end

        # Current processing status
        module Status
          extend AcmeAISDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                AcmeAISDK::Models::FileFileslistResponse::File::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol
            )
          PROCESSING =
            T.let(
              :processing,
              AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                AcmeAISDK::Models::FileFileslistResponse::File::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
