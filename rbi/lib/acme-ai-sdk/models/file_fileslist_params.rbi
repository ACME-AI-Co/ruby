# typed: strong

module AcmeAISDK
  module Models
    class FileFileslistParams < AcmeAISDK::BaseModel
      extend AcmeAISDK::RequestParameters::Converter
      include AcmeAISDK::RequestParameters

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
      sig { returns(T.nilable(AcmeAISDK::Models::FileFileslistParams::SortBy::OrSymbol)) }
      attr_reader :sort_by

      sig { params(sort_by: AcmeAISDK::Models::FileFileslistParams::SortBy::OrSymbol).void }
      attr_writer :sort_by

      # Sort order
      sig { returns(T.nilable(AcmeAISDK::Models::FileFileslistParams::SortOrder::OrSymbol)) }
      attr_reader :sort_order

      sig { params(sort_order: AcmeAISDK::Models::FileFileslistParams::SortOrder::OrSymbol).void }
      attr_writer :sort_order

      # Filter by processing status
      sig { returns(T.nilable(AcmeAISDK::Models::FileFileslistParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: AcmeAISDK::Models::FileFileslistParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          limit: Integer,
          offset: Integer,
          sort_by: AcmeAISDK::Models::FileFileslistParams::SortBy::OrSymbol,
          sort_order: AcmeAISDK::Models::FileFileslistParams::SortOrder::OrSymbol,
          status: AcmeAISDK::Models::FileFileslistParams::Status::OrSymbol,
          request_options: T.any(AcmeAISDK::RequestOptions, AcmeAISDK::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(limit: nil, offset: nil, sort_by: nil, sort_order: nil, status: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              limit: Integer,
              offset: Integer,
              sort_by: AcmeAISDK::Models::FileFileslistParams::SortBy::OrSymbol,
              sort_order: AcmeAISDK::Models::FileFileslistParams::SortOrder::OrSymbol,
              status: AcmeAISDK::Models::FileFileslistParams::Status::OrSymbol,
              request_options: AcmeAISDK::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Field to sort by
      module SortBy
        extend AcmeAISDK::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, AcmeAISDK::Models::FileFileslistParams::SortBy) }
        OrSymbol = T.type_alias { T.any(Symbol, AcmeAISDK::Models::FileFileslistParams::SortBy::TaggedSymbol) }

        UPLOAD_TIME = T.let(:upload_time, AcmeAISDK::Models::FileFileslistParams::SortBy::TaggedSymbol)
        STATUS = T.let(:status, AcmeAISDK::Models::FileFileslistParams::SortBy::TaggedSymbol)

        sig { override.returns(T::Array[AcmeAISDK::Models::FileFileslistParams::SortBy::TaggedSymbol]) }
        def self.values
        end
      end

      # Sort order
      module SortOrder
        extend AcmeAISDK::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, AcmeAISDK::Models::FileFileslistParams::SortOrder) }
        OrSymbol =
          T.type_alias { T.any(Symbol, AcmeAISDK::Models::FileFileslistParams::SortOrder::TaggedSymbol) }

        ASC = T.let(:asc, AcmeAISDK::Models::FileFileslistParams::SortOrder::TaggedSymbol)
        DESC = T.let(:desc, AcmeAISDK::Models::FileFileslistParams::SortOrder::TaggedSymbol)

        sig { override.returns(T::Array[AcmeAISDK::Models::FileFileslistParams::SortOrder::TaggedSymbol]) }
        def self.values
        end
      end

      # Filter by processing status
      module Status
        extend AcmeAISDK::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, AcmeAISDK::Models::FileFileslistParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, AcmeAISDK::Models::FileFileslistParams::Status::TaggedSymbol) }

        PENDING = T.let(:pending, AcmeAISDK::Models::FileFileslistParams::Status::TaggedSymbol)
        PROCESSING = T.let(:processing, AcmeAISDK::Models::FileFileslistParams::Status::TaggedSymbol)
        COMPLETED = T.let(:completed, AcmeAISDK::Models::FileFileslistParams::Status::TaggedSymbol)
        FAILED = T.let(:failed, AcmeAISDK::Models::FileFileslistParams::Status::TaggedSymbol)

        sig { override.returns(T::Array[AcmeAISDK::Models::FileFileslistParams::Status::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
