# frozen_string_literal: true

module AcmeAISDK
  class Error < StandardError
    # @!parse
    #   # @return [StandardError, nil]
    #   attr_accessor :cause
  end

  class ConversionError < AcmeAISDK::Error
  end

  class APIError < AcmeAISDK::Error
    # @return [URI::Generic]
    attr_accessor :url

    # @return [Integer, nil]
    attr_accessor :status

    # @return [Object, nil]
    attr_accessor :body

    # @api private
    #
    # @param url [URI::Generic]
    # @param status [Integer, nil]
    # @param body [Object, nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
      @url = url
      @status = status
      @body = body
      @request = request
      @response = response
      super(message)
    end
  end

  class APIConnectionError < AcmeAISDK::APIError
    # @!parse
    #   # @return [nil]
    #   attr_accessor :status

    # @!parse
    #   # @return [nil]
    #   attr_accessor :body

    # @api private
    #
    # @param url [URI::Generic]
    # @param status [nil]
    # @param body [nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    def initialize(
      url:,
      status: nil,
      body: nil,
      request: nil,
      response: nil,
      message: "Connection error."
    )
      super
    end
  end

  class APITimeoutError < AcmeAISDK::APIConnectionError
    # @api private
    #
    # @param url [URI::Generic]
    # @param status [nil]
    # @param body [nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    def initialize(
      url:,
      status: nil,
      body: nil,
      request: nil,
      response: nil,
      message: "Request timed out."
    )
      super
    end
  end

  class APIStatusError < AcmeAISDK::APIError
    # @api private
    #
    # @param url [URI::Generic]
    # @param status [Integer]
    # @param body [Object, nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    #
    # @return [AcmeAISDK::APIStatusError]
    def self.for(url:, status:, body:, request:, response:, message: nil)
      kwargs = {url: url, status: status, body: body, request: request, response: response, message: message}

      case status
      in 400
        AcmeAISDK::BadRequestError.new(**kwargs)
      in 401
        AcmeAISDK::AuthenticationError.new(**kwargs)
      in 403
        AcmeAISDK::PermissionDeniedError.new(**kwargs)
      in 404
        AcmeAISDK::NotFoundError.new(**kwargs)
      in 409
        AcmeAISDK::ConflictError.new(**kwargs)
      in 422
        AcmeAISDK::UnprocessableEntityError.new(**kwargs)
      in 429
        AcmeAISDK::RateLimitError.new(**kwargs)
      in (500..)
        AcmeAISDK::InternalServerError.new(**kwargs)
      else
        AcmeAISDK::APIStatusError.new(**kwargs)
      end
    end

    # @!parse
    #   # @return [Integer]
    #   attr_accessor :status

    # @api private
    #
    # @param url [URI::Generic]
    # @param status [Integer]
    # @param body [Object, nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    def initialize(url:, status:, body:, request:, response:, message: nil)
      message ||= {url: url.to_s, status: status, body: body}
      super(
        url: url,
        status: status,
        body: body,
        request: request,
        response: response,
        message: message&.to_s
      )
    end
  end

  class BadRequestError < AcmeAISDK::APIStatusError
    HTTP_STATUS = 400
  end

  class AuthenticationError < AcmeAISDK::APIStatusError
    HTTP_STATUS = 401
  end

  class PermissionDeniedError < AcmeAISDK::APIStatusError
    HTTP_STATUS = 403
  end

  class NotFoundError < AcmeAISDK::APIStatusError
    HTTP_STATUS = 404
  end

  class ConflictError < AcmeAISDK::APIStatusError
    HTTP_STATUS = 409
  end

  class UnprocessableEntityError < AcmeAISDK::APIStatusError
    HTTP_STATUS = 422
  end

  class RateLimitError < AcmeAISDK::APIStatusError
    HTTP_STATUS = 429
  end

  class InternalServerError < AcmeAISDK::APIStatusError
    HTTP_STATUS = (500..)
  end
end
