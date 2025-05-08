# typed: strong

module AcmeAISDK
  module Models
    class FileFileslistParams < AcmeAISDK::Internal::Type::BaseModel
      extend AcmeAISDK::Internal::Type::RequestParameters::Converter
      include AcmeAISDK::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, AcmeAISDK::Internal::AnyHash) }

      # Maximum number of files to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Number of files to skip
      sig { returns(T.nilable(Integer)) }
      attr_reader :offset

      sig { params(offset: Integer).void }
      attr_writer :offset

      # Field to sort by
      sig do
        returns(T.nilable(AcmeAISDK::FileFileslistParams::SortBy::OrSymbol))
      end
      attr_reader :sort_by

      sig do
        params(sort_by: AcmeAISDK::FileFileslistParams::SortBy::OrSymbol).void
      end
      attr_writer :sort_by

      # Sort order
      sig do
        returns(T.nilable(AcmeAISDK::FileFileslistParams::SortOrder::OrSymbol))
      end
      attr_reader :sort_order

      sig do
        params(
          sort_order: AcmeAISDK::FileFileslistParams::SortOrder::OrSymbol
        ).void
      end
      attr_writer :sort_order

      # Filter by processing status
      sig do
        returns(T.nilable(AcmeAISDK::FileFileslistParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: AcmeAISDK::FileFileslistParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          limit: Integer,
          offset: Integer,
          sort_by: AcmeAISDK::FileFileslistParams::SortBy::OrSymbol,
          sort_order: AcmeAISDK::FileFileslistParams::SortOrder::OrSymbol,
          status: AcmeAISDK::FileFileslistParams::Status::OrSymbol,
          request_options: AcmeAISDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Maximum number of files to return
        limit: nil,
        # Number of files to skip
        offset: nil,
        # Field to sort by
        sort_by: nil,
        # Sort order
        sort_order: nil,
        # Filter by processing status
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            limit: Integer,
            offset: Integer,
            sort_by: AcmeAISDK::FileFileslistParams::SortBy::OrSymbol,
            sort_order: AcmeAISDK::FileFileslistParams::SortOrder::OrSymbol,
            status: AcmeAISDK::FileFileslistParams::Status::OrSymbol,
            request_options: AcmeAISDK::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Field to sort by
      module SortBy
        extend AcmeAISDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, AcmeAISDK::FileFileslistParams::SortBy) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        UPLOAD_TIME =
          T.let(
            :upload_time,
            AcmeAISDK::FileFileslistParams::SortBy::TaggedSymbol
          )
        STATUS =
          T.let(:status, AcmeAISDK::FileFileslistParams::SortBy::TaggedSymbol)

        sig do
          override.returns(
            T::Array[AcmeAISDK::FileFileslistParams::SortBy::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Sort order
      module SortOrder
        extend AcmeAISDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, AcmeAISDK::FileFileslistParams::SortOrder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC =
          T.let(:asc, AcmeAISDK::FileFileslistParams::SortOrder::TaggedSymbol)
        DESC =
          T.let(:desc, AcmeAISDK::FileFileslistParams::SortOrder::TaggedSymbol)

        sig do
          override.returns(
            T::Array[AcmeAISDK::FileFileslistParams::SortOrder::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter by processing status
      module Status
        extend AcmeAISDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, AcmeAISDK::FileFileslistParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, AcmeAISDK::FileFileslistParams::Status::TaggedSymbol)
        PROCESSING =
          T.let(
            :processing,
            AcmeAISDK::FileFileslistParams::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            AcmeAISDK::FileFileslistParams::Status::TaggedSymbol
          )
        FAILED =
          T.let(:failed, AcmeAISDK::FileFileslistParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[AcmeAISDK::FileFileslistParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
