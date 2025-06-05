# frozen_string_literal: true

module AcmeAISDK
  module Internal
    # @generic Elem
    #
    # @example
    #   if offset.has_next?
    #     offset = offset.next_page
    #   end
    #
    # @example
    #   offset.auto_paging_each do |file|
    #     puts(file)
    #   end
    class Offset
      include AcmeAISDK::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :files

      # @return [Integer]
      attr_accessor :total

      # @return [Boolean]
      def next_page?
        !files.to_a.empty? && (@req.dig(
          :request_options,
          :params,
          :offset
        ).to_i + files.to_a.size < total.to_i)
      end

      # @raise [AcmeAISDK::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = AcmeAISDK::Internal::Util.deep_merge(
          @req,
          {
            query: {
              offset: @req.dig(
                :request_options,
                :params,
                :offset
              ).to_i + files.to_a.size
            }
          }
        )
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.files&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [AcmeAISDK::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}, Net::HTTPHeader]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {files: Array => files}
          @files = files.map { AcmeAISDK::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        @total = page_data[:total]
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = AcmeAISDK::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} total=#{total.inspect}>"
      end
    end
  end
end
