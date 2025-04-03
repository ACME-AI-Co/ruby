# typed: strong

module AcmeAISDK
  module Errors
    class Error < StandardError
      sig { returns(T.nilable(StandardError)) }
      attr_accessor :cause
    end

    class ConversionError < AcmeAISDK::Errors::Error
    end

    class APIError < AcmeAISDK::Errors::Error
      sig { returns(URI::Generic) }
      attr_accessor :url

      sig { returns(T.nilable(Integer)) }
      attr_accessor :status

      sig { returns(T.nilable(T.anything)) }
      attr_accessor :body

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: T.nilable(Integer),
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
      end
    end

    class APIConnectionError < AcmeAISDK::Errors::APIError
      sig { void }
      attr_accessor :status

      sig { void }
      attr_accessor :body

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: NilClass,
          body: NilClass,
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(url:, status: nil, body: nil, request: nil, response: nil, message: "Connection error.")
      end
    end

    class APITimeoutError < AcmeAISDK::Errors::APIConnectionError
      # @api private
      sig do
        params(
          url: URI::Generic,
          status: NilClass,
          body: NilClass,
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(url:, status: nil, body: nil, request: nil, response: nil, message: "Request timed out.")
      end
    end

    class APIStatusError < AcmeAISDK::Errors::APIError
      # @api private
      sig do
        params(
          url: URI::Generic,
          status: Integer,
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.for(url:, status:, body:, request:, response:, message: nil)
      end

      sig { returns(Integer) }
      attr_accessor :status

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: Integer,
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(url:, status:, body:, request:, response:, message: nil)
      end
    end

    class BadRequestError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = 400
    end

    class AuthenticationError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = 401
    end

    class PermissionDeniedError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = 403
    end

    class NotFoundError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = 404
    end

    class ConflictError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = 409
    end

    class UnprocessableEntityError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = 422
    end

    class RateLimitError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = 429
    end

    class InternalServerError < AcmeAISDK::Errors::APIStatusError
      HTTP_STATUS = T.let((500..), T::Range[Integer])
    end
  end

  Error = AcmeAISDK::Errors::Error

  ConversionError = AcmeAISDK::Errors::ConversionError

  APIError = AcmeAISDK::Errors::APIError

  APIStatusError = AcmeAISDK::Errors::APIStatusError

  APIConnectionError = AcmeAISDK::Errors::APIConnectionError

  APITimeoutError = AcmeAISDK::Errors::APITimeoutError

  BadRequestError = AcmeAISDK::Errors::BadRequestError

  AuthenticationError = AcmeAISDK::Errors::AuthenticationError

  PermissionDeniedError = AcmeAISDK::Errors::PermissionDeniedError

  NotFoundError = AcmeAISDK::Errors::NotFoundError

  ConflictError = AcmeAISDK::Errors::ConflictError

  UnprocessableEntityError = AcmeAISDK::Errors::UnprocessableEntityError

  RateLimitError = AcmeAISDK::Errors::RateLimitError

  InternalServerError = AcmeAISDK::Errors::InternalServerError
end
