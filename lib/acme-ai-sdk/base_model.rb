# frozen_string_literal: true

module AcmeAISDK
  # @api private
  module Converter
    # rubocop:disable Lint/UnusedMethodArgument

    # @api private
    #
    # @param value [Object]
    #
    # @return [Object]
    def coerce(value) = value

    # @api private
    #
    # @param value [Object]
    #
    # @return [Object]
    def dump(value) = value

    # @api private
    #
    # @param value [Object]
    #
    # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
    def try_strict_coerce(value) = (raise NotImplementedError)

    # rubocop:enable Lint/UnusedMethodArgument

    class << self
      # @api private
      #
      # @param spec [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class] .
      #
      #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
      #
      #   @option spec [Proc] :enum
      #
      #   @option spec [Proc] :union
      #
      #   @option spec [Boolean] :"nil?"
      #
      # @return [Proc]
      def type_info(spec)
        case spec
        in Hash
          type_info(spec.slice(:const, :enum, :union).first&.last)
        in Proc
          spec
        in AcmeAISDK::Converter | Module | Symbol
          -> { spec }
        in true | false
          -> { AcmeAISDK::BooleanModel }
        in NilClass | Integer | Float
          -> { spec.class }
        end
      end

      # @api private
      #
      # Based on `target`, transform `value` into `target`, to the extent possible:
      #
      #   1. if the given `value` conforms to `target` already, return the given `value`
      #   2. if it's possible and safe to convert the given `value` to `target`, then the
      #      converted value
      #   3. otherwise, the given `value` unaltered
      #
      # @param target [AcmeAISDK::Converter, Class]
      # @param value [Object]
      #
      # @return [Object]
      def coerce(target, value)
        case target
        in AcmeAISDK::Converter
          target.coerce(value)
        in Symbol
          case value
          in Symbol | String if (val = value.to_sym) == target
            val
          else
            value
          end
        in Module
          case target
          in -> { _1 <= NilClass }
            nil
          in -> { _1 <= Integer }
            value.is_a?(Numeric) ? Integer(value) : value
          in -> { _1 <= Float }
            value.is_a?(Numeric) ? Float(value) : value
          in -> { _1 <= Symbol }
            value.is_a?(String) ? value.to_sym : value
          in -> { _1 <= String }
            value.is_a?(Symbol) ? value.to_s : value
          in -> { _1 <= Date || _1 <= Time }
            value.is_a?(String) ? target.parse(value) : value
          in -> { _1 <= IO }
            value.is_a?(String) ? StringIO.new(value) : value
          else
            value
          end
        end
      end

      # @api private
      #
      # @param target [AcmeAISDK::Converter, Class]
      # @param value [Object]
      #
      # @return [Object]
      def dump(target, value)
        case target
        in AcmeAISDK::Converter
          target.dump(value)
        else
          value
        end
      end

      # @api private
      #
      # The underlying algorithm for computing maximal compatibility is subject to
      #   future improvements.
      #
      #   Similar to `#.coerce`, used to determine the best union variant to decode into.
      #
      #   1. determine if strict-ish coercion is possible
      #   2. return either result of successful coercion or if loose coercion is possible
      #   3. return a score for recursively tallied count for fields that can be coerced
      #
      # @param target [AcmeAISDK::Converter, Class]
      # @param value [Object]
      #
      # @return [Object]
      def try_strict_coerce(target, value)
        case target
        in AcmeAISDK::Converter
          target.try_strict_coerce(value)
        in Symbol
          case value
          in Symbol | String if (val = value.to_sym) == target
            [true, val, 1]
          else
            [false, false, 0]
          end
        in Module
          case [target, value]
          in [-> { _1 <= NilClass }, _]
            [true, nil, value.nil? ? 1 : 0]
          in [-> { _1 <= Integer }, Numeric]
            [true, Integer(value), 1]
          in [-> { _1 <= Float }, Numeric]
            [true, Float(value), 1]
          in [-> { _1 <= Symbol }, String]
            [true, value.to_sym, 1]
          in [-> { _1 <= String }, Symbol]
            [true, value.to_s, 1]
          in [-> { _1 <= Date || _1 <= Time }, String]
            Kernel.then do
              [true, target.parse(value), 1]
            rescue ArgumentError
              [false, false, 0]
            end
          in [_, ^target]
            [true, value, 1]
          else
            [false, false, 0]
          end
        end
      end
    end
  end

  # @api private
  #
  # @abstract
  #
  # When we don't know what to expect for the value.
  class Unknown
    extend AcmeAISDK::Converter

    # rubocop:disable Lint/UnusedMethodArgument

    # @param other [Object]
    #
    # @return [Boolean]
    def self.===(other) = true

    # @param other [Object]
    #
    # @return [Boolean]
    def self.==(other) = other.is_a?(Class) && other <= AcmeAISDK::Unknown

    class << self
      # @!parse
      #   # @api private
      #   #
      #   # @param value [Object]
      #   #
      #   # @return [Object]
      #   def coerce(value) = super

      # @!parse
      #   # @api private
      #   #
      #   # @param value [Object]
      #   #
      #   # @return [Object]
      #   def dump(value) = super

      # @api private
      #
      # @param value [Object]
      #
      # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
      def try_strict_coerce(value)
        # prevent unknown variant from being chosen during the first coercion pass
        [false, true, 0]
      end
    end

    # rubocop:enable Lint/UnusedMethodArgument
  end

  # @api private
  #
  # @abstract
  #
  # Ruby has no Boolean class; this is something for models to refer to.
  class BooleanModel
    extend AcmeAISDK::Converter

    # @param other [Object]
    #
    # @return [Boolean]
    def self.===(other) = other == true || other == false

    # @param other [Object]
    #
    # @return [Boolean]
    def self.==(other) = other.is_a?(Class) && other <= AcmeAISDK::BooleanModel

    class << self
      # @!parse
      #   # @api private
      #   #
      #   # @param value [Boolean, Object]
      #   #
      #   # @return [Boolean, Object]
      #   def coerce(value) = super

      # @!parse
      #   # @api private
      #   #
      #   # @param value [Boolean, Object]
      #   #
      #   # @return [Boolean, Object]
      #   def dump(value) = super

      # @api private
      #
      # @param value [Object]
      #
      # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
      def try_strict_coerce(value)
        case value
        in true | false
          [true, value, 1]
        else
          [false, false, 0]
        end
      end
    end
  end

  # @api private
  #
  # A value from among a specified list of options. OpenAPI enum values map to Ruby
  #   values in the SDK as follows:
  #
  #   1. boolean => true | false
  #   2. integer => Integer
  #   3. float => Float
  #   4. string => Symbol
  #
  #   We can therefore convert string values to Symbols, but can't convert other
  #   values safely.
  module Enum
    include AcmeAISDK::Converter

    # All of the valid Symbol values for this enum.
    #
    # @return [Array<NilClass, Boolean, Integer, Float, Symbol>]
    def values = (@values ||= constants.map { const_get(_1) })

    # @api private
    #
    # Guard against thread safety issues by instantiating `@values`.
    private def finalize! = values

    # @param other [Object]
    #
    # @return [Boolean]
    def ===(other) = values.include?(other)

    # @param other [Object]
    #
    # @return [Boolean]
    def ==(other)
      other.is_a?(Module) && other.singleton_class.ancestors.include?(AcmeAISDK::Enum) && other.values.to_set == values.to_set
    end

    # @api private
    #
    # @param value [String, Symbol, Object]
    #
    # @return [Symbol, Object]
    def coerce(value)
      case value
      in Symbol | String if values.include?(val = value.to_sym)
        val
      else
        value
      end
    end

    # @!parse
    #   # @api private
    #   #
    #   # @param value [Symbol, Object]
    #   #
    #   # @return [Symbol, Object]
    #   def dump(value) = super

    # @api private
    #
    # @param value [Object]
    #
    # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
    def try_strict_coerce(value)
      return [true, value, 1] if values.include?(value)

      case value
      in Symbol | String if values.include?(val = value.to_sym)
        [true, val, 1]
      else
        case [value, values.first]
        in [true | false, true | false] | [Integer, Integer] | [Symbol | String, Symbol]
          [false, true, 0]
        else
          [false, false, 0]
        end
      end
    end
  end

  # @api private
  module Union
    include AcmeAISDK::Converter

    # @api private
    #
    # All of the specified variant info for this union.
    #
    # @return [Array<Array(Symbol, Proc)>]
    private def known_variants = (@known_variants ||= [])

    # @api private
    #
    # @return [Array<Array(Symbol, Object)>]
    protected def derefed_variants
      @known_variants.map { |key, variant_fn| [key, variant_fn.call] }
    end

    # All of the specified variants for this union.
    #
    # @return [Array<Object>]
    def variants
      derefed_variants.map(&:last)
    end

    # @api private
    #
    # @param property [Symbol]
    private def discriminator(property)
      case property
      in Symbol
        @discriminator = property
      end
    end

    # @api private
    #
    # @param key [Symbol, Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
    #
    # @param spec [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class] .
    #
    #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
    #
    #   @option spec [Proc] :enum
    #
    #   @option spec [Proc] :union
    #
    #   @option spec [Boolean] :"nil?"
    private def variant(key, spec = nil)
      variant_info =
        case key
        in Symbol
          [key, AcmeAISDK::Converter.type_info(spec)]
        in Proc | AcmeAISDK::Converter | Module | Hash
          [nil, AcmeAISDK::Converter.type_info(key)]
        end

      known_variants << variant_info
    end

    # @api private
    #
    # @param value [Object]
    #
    # @return [AcmeAISDK::Converter, Class, nil]
    private def resolve_variant(value)
      case [@discriminator, value]
      in [_, AcmeAISDK::BaseModel]
        value.class
      in [Symbol, Hash]
        key =
          if value.key?(@discriminator)
            value.fetch(@discriminator)
          elsif value.key?((discriminator = @discriminator.to_s))
            value.fetch(discriminator)
          end

        key = key.to_sym if key.is_a?(String)
        _, resolved = known_variants.find { |k,| k == key }
        resolved.nil? ? AcmeAISDK::Unknown : resolved.call
      else
        nil
      end
    end

    # rubocop:disable Style/HashEachMethods
    # rubocop:disable Style/CaseEquality

    # @param other [Object]
    #
    # @return [Boolean]
    def ===(other)
      known_variants.any? do |_, variant_fn|
        variant_fn.call === other
      end
    end

    # @param other [Object]
    #
    # @return [Boolean]
    def ==(other)
      other.is_a?(Module) && other.singleton_class.ancestors.include?(AcmeAISDK::Union) && other.derefed_variants == derefed_variants
    end

    # @api private
    #
    # @param value [Object]
    #
    # @return [Object]
    def coerce(value)
      if (variant = resolve_variant(value))
        return AcmeAISDK::Converter.coerce(variant, value)
      end

      matches = []

      known_variants.each do |_, variant_fn|
        variant = variant_fn.call

        case AcmeAISDK::Converter.try_strict_coerce(variant, value)
        in [true, coerced, _]
          return coerced
        in [false, true, score]
          matches << [score, variant]
        in [false, false, _]
          nil
        end
      end

      _, variant = matches.sort! { _2.first <=> _1.first }.find { |score,| !score.zero? }
      variant.nil? ? value : AcmeAISDK::Converter.coerce(variant, value)
    end

    # @api private
    #
    # @param value [Object]
    #
    # @return [Object]
    def dump(value)
      if (variant = resolve_variant(value))
        return AcmeAISDK::Converter.dump(variant, value)
      end

      known_variants.each do |_, variant_fn|
        variant = variant_fn.call
        if variant === value
          return AcmeAISDK::Converter.dump(variant, value)
        end
      end
      value
    end

    # @api private
    #
    # @param value [Object]
    #
    # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
    def try_strict_coerce(value)
      # TODO(ruby) this will result in super linear decoding behaviour for nested unions
      # follow up with a decoding context that captures current strictness levels
      if (variant = resolve_variant(value))
        return Converter.try_strict_coerce(variant, value)
      end

      coercible = false
      max_score = 0

      known_variants.each do |_, variant_fn|
        variant = variant_fn.call

        case AcmeAISDK::Converter.try_strict_coerce(variant, value)
        in [true, coerced, score]
          return [true, coerced, score]
        in [false, true, score]
          coercible = true
          max_score = [max_score, score].max
        in [false, false, _]
          nil
        end
      end

      [false, coercible, max_score]
    end

    # rubocop:enable Style/CaseEquality
    # rubocop:enable Style/HashEachMethods
  end

  # @api private
  #
  # @abstract
  #
  # Array of items of a given type.
  class ArrayOf
    include AcmeAISDK::Converter

    # @param type_info [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
    #
    # @param spec [Hash{Symbol=>Object}] .
    #
    #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
    #
    #   @option spec [Proc] :enum
    #
    #   @option spec [Proc] :union
    #
    #   @option spec [Boolean] :"nil?"
    def self.[](type_info, spec = {}) = new(type_info, spec)

    # @param other [Object]
    #
    # @return [Boolean]
    def ===(other)
      type = item_type
      case other
      in Array
        # rubocop:disable Style/CaseEquality
        other.all? { type === _1 }
        # rubocop:enable Style/CaseEquality
      else
        false
      end
    end

    # @param other [Object]
    #
    # @return [Boolean]
    def ==(other) = other.is_a?(AcmeAISDK::ArrayOf) && other.item_type == item_type

    # @api private
    #
    # @param value [Enumerable, Object]
    #
    # @return [Array<Object>, Object]
    def coerce(value)
      type = item_type
      case value
      in Enumerable unless value.is_a?(Hash)
        value.map { AcmeAISDK::Converter.coerce(type, _1) }
      else
        value
      end
    end

    # @api private
    #
    # @param value [Enumerable, Object]
    #
    # @return [Array<Object>, Object]
    def dump(value)
      type = item_type
      case value
      in Enumerable unless value.is_a?(Hash)
        value.map { AcmeAISDK::Converter.dump(type, _1) }.to_a
      else
        value
      end
    end

    # @api private
    #
    # @param value [Object]
    #
    # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
    def try_strict_coerce(value)
      case value
      in Array
        type = item_type
        great_success = true
        tally = 0

        mapped =
          value.map do |item|
            case AcmeAISDK::Converter.try_strict_coerce(type, item)
            in [true, coerced, score]
              tally += score
              coerced
            in [false, true, score]
              great_success = false
              tally += score
              item
            in [false, false, _]
              great_success &&= item.nil?
              item
            end
          end

        if great_success
          [true, mapped, tally]
        else
          [false, true, tally]
        end
      else
        [false, false, 0]
      end
    end

    # @api private
    #
    # @return [AcmeAISDK::Converter, Class]
    protected def item_type = @item_type_fn.call

    # @api private
    #
    # @param type_info [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
    #
    # @param spec [Hash{Symbol=>Object}] .
    #
    #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
    #
    #   @option spec [Proc] :enum
    #
    #   @option spec [Proc] :union
    #
    #   @option spec [Boolean] :"nil?"
    def initialize(type_info, spec = {})
      @item_type_fn = AcmeAISDK::Converter.type_info(type_info || spec)
    end
  end

  # @api private
  #
  # @abstract
  #
  # Hash of items of a given type.
  class HashOf
    include AcmeAISDK::Converter

    # @param type_info [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
    #
    # @param spec [Hash{Symbol=>Object}] .
    #
    #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
    #
    #   @option spec [Proc] :enum
    #
    #   @option spec [Proc] :union
    #
    #   @option spec [Boolean] :"nil?"
    def self.[](type_info, spec = {}) = new(type_info, spec)

    # @param other [Object]
    #
    # @return [Boolean]
    def ===(other)
      type = item_type
      case other
      in Hash
        other.all? do |key, val|
          case [key, val]
          in [Symbol | String, ^type]
            true
          else
            false
          end
        end
      else
        false
      end
    end

    # @param other [Object]
    #
    # @return [Boolean]
    def ==(other) = other.is_a?(AcmeAISDK::HashOf) && other.item_type == item_type

    # @api private
    #
    # @param value [Hash{Object=>Object}, Object]
    #
    # @return [Hash{Symbol=>Object}, Object]
    def coerce(value)
      type = item_type
      case value
      in Hash
        value.to_h do |key, val|
          coerced = AcmeAISDK::Converter.coerce(type, val)
          [key.is_a?(String) ? key.to_sym : key, coerced]
        end
      else
        value
      end
    end

    # @api private
    #
    # @param value [Hash{Object=>Object}, Object]
    #
    # @return [Hash{Symbol=>Object}, Object]
    def dump(value)
      type = item_type
      case value
      in Hash
        value.transform_values do |val|
          AcmeAISDK::Converter.dump(type, val)
        end
      else
        value
      end
    end

    # @api private
    #
    # @param value [Object]
    #
    # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
    def try_strict_coerce(value)
      case value
      in Hash
        type = item_type
        great_success = true
        tally = 0

        mapped =
          value.transform_values do |val|
            case AcmeAISDK::Converter.try_strict_coerce(type, val)
            in [true, coerced, score]
              tally += score
              coerced
            in [false, true, score]
              great_success = false
              tally += score
              val
            in [false, false, _]
              great_success &&= val.nil?
              val
            end
          end

        if great_success
          [true, mapped, tally]
        else
          [false, true, tally]
        end
      else
        [false, false, 0]
      end
    end

    # @api private
    #
    # @return [AcmeAISDK::Converter, Class]
    protected def item_type = @item_type_fn.call

    # @api private
    #
    # @param type_info [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
    #
    # @param spec [Hash{Symbol=>Object}] .
    #
    #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
    #
    #   @option spec [Proc] :enum
    #
    #   @option spec [Proc] :union
    #
    #   @option spec [Boolean] :"nil?"
    def initialize(type_info, spec = {})
      @item_type_fn = AcmeAISDK::Converter.type_info(type_info || spec)
    end
  end

  # @abstract
  #
  # @example
  #   # `file_file_create_response` is a `AcmeAISDK::Models::FileFileCreateResponse`
  #   file_file_create_response => {
  #     file_id: file_id,
  #     status: status,
  #     upload_time: upload_time
  #   }
  class BaseModel
    extend AcmeAISDK::Converter

    class << self
      # @api private
      #
      # Assumes superclass fields are totally defined before fields are accessed /
      #   defined on subclasses.
      #
      # @return [Hash{Symbol=>Hash{Symbol=>Object}}]
      def known_fields
        @known_fields ||= (self < AcmeAISDK::BaseModel ? superclass.known_fields.dup : {})
      end

      # @api private
      #
      # @return [Hash{Symbol=>Symbol}]
      def reverse_map
        @reverse_map ||= (self < AcmeAISDK::BaseModel ? superclass.reverse_map.dup : {})
      end

      # @api private
      #
      # @return [Hash{Symbol=>Hash{Symbol=>Object}}]
      def fields
        known_fields.transform_values do |field|
          {**field.except(:type_fn), type: field.fetch(:type_fn).call}
        end
      end

      # @api private
      #
      # @return [Hash{Symbol=>Proc}]
      def defaults = (@defaults ||= {})

      # @api private
      #
      # @param name_sym [Symbol]
      #
      # @param required [Boolean]
      #
      # @param type_info [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
      #
      # @param spec [Hash{Symbol=>Object}] .
      #
      #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
      #
      #   @option spec [Proc] :enum
      #
      #   @option spec [Proc] :union
      #
      #   @option spec [Boolean] :"nil?"
      private def add_field(name_sym, required:, type_info:, spec:)
        type_fn, info =
          case type_info
          in Proc | Module | AcmeAISDK::Converter
            [AcmeAISDK::Converter.type_info({**spec, union: type_info}), spec]
          in Hash
            [AcmeAISDK::Converter.type_info(type_info), type_info]
          end

        fallback = info[:const]
        defaults[name_sym] = fallback if required && !info[:nil?] && info.key?(:const)

        key = info[:api_name]&.tap { reverse_map[_1] = name_sym } || name_sym
        setter = "#{name_sym}="

        if known_fields.key?(name_sym)
          [name_sym, setter].each { undef_method(_1) }
        end

        known_fields[name_sym] = {mode: @mode, key: key, required: required, type_fn: type_fn}

        define_method(setter) do |val|
          @data[key] = val
        end

        define_method(name_sym) do
          field_type = type_fn.call
          value = @data.fetch(key) { self.class.defaults[key] }
          AcmeAISDK::Converter.coerce(field_type, value)
        rescue StandardError
          name = self.class.name.split("::").last
          raise AcmeAISDK::ConversionError.new(
            "Failed to parse #{name}.#{name_sym} as #{field_type.inspect}. " \
            "To get the unparsed API response, use #{name}[:#{key}]."
          )
        end
      end

      # @api private
      #
      # @param name_sym [Symbol]
      #
      # @param type_info [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
      #
      # @param spec [Hash{Symbol=>Object}] .
      #
      #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
      #
      #   @option spec [Proc] :enum
      #
      #   @option spec [Proc] :union
      #
      #   @option spec [Boolean] :"nil?"
      def required(name_sym, type_info, spec = {})
        add_field(name_sym, required: true, type_info: type_info, spec: spec)
      end

      # @api private
      #
      # @param name_sym [Symbol]
      #
      # @param type_info [Hash{Symbol=>Object}, Proc, AcmeAISDK::Converter, Class]
      #
      # @param spec [Hash{Symbol=>Object}] .
      #
      #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
      #
      #   @option spec [Proc] :enum
      #
      #   @option spec [Proc] :union
      #
      #   @option spec [Boolean] :"nil?"
      def optional(name_sym, type_info, spec = {})
        add_field(name_sym, required: false, type_info: type_info, spec: spec)
      end

      # @api private
      #
      # `request_only` attributes not excluded from `.#coerce` when receiving responses
      #   even if well behaved servers should not send them
      #
      # @param blk [Proc]
      private def request_only(&blk)
        @mode = :dump
        blk.call
      ensure
        @mode = nil
      end

      # @api private
      #
      # `response_only` attributes are omitted from `.#dump` when making requests
      #
      # @param blk [Proc]
      private def response_only(&blk)
        @mode = :coerce
        blk.call
      ensure
        @mode = nil
      end
    end

    # @param other [Object]
    #
    # @return [Boolean]
    def ==(other)
      case other
      in AcmeAISDK::BaseModel
        self.class.fields == other.class.fields && @data == other.to_h
      else
        false
      end
    end

    class << self
      # @api private
      #
      # @param value [AcmeAISDK::BaseModel, Hash{Object=>Object}, Object]
      #
      # @return [AcmeAISDK::BaseModel, Object]
      def coerce(value)
        case AcmeAISDK::Util.coerce_hash(value)
        in Hash => coerced
          new(coerced)
        else
          value
        end
      end

      # @api private
      #
      # @param value [AcmeAISDK::BaseModel, Object]
      #
      # @return [Hash{Object=>Object}, Object]
      def dump(value)
        unless (coerced = AcmeAISDK::Util.coerce_hash(value)).is_a?(Hash)
          return value
        end

        values = coerced.filter_map do |key, val|
          name = key.to_sym
          case (field = known_fields[name])
          in nil
            [name, val]
          else
            mode, type_fn, api_name = field.fetch_values(:mode, :type_fn, :key)
            case mode
            in :coerce
              next
            else
              target = type_fn.call
              [api_name, AcmeAISDK::Converter.dump(target, val)]
            end
          end
        end.to_h

        defaults.each do |key, val|
          next if values.key?(key)

          values[key] = val
        end

        values
      end

      # @api private
      #
      # @param value [Object]
      #
      # @return [Array(true, Object, nil), Array(false, Boolean, Integer)]
      def try_strict_coerce(value)
        case value
        in Hash | AcmeAISDK::BaseModel
          value = value.to_h
        else
          return [false, false, 0]
        end

        keys = value.keys.to_set
        great_success = true
        tally = 0
        acc = {}

        known_fields.each_value do |field|
          mode, required, type_fn, api_name = field.fetch_values(:mode, :required, :type_fn, :key)
          keys.delete(api_name)

          case [required && mode != :dump, value.key?(api_name)]
          in [_, true]
            target = type_fn.call
            item = value.fetch(api_name)
            case AcmeAISDK::Converter.try_strict_coerce(target, item)
            in [true, coerced, score]
              tally += score
              acc[api_name] = coerced
            in [false, true, score]
              great_success = false
              tally += score
              acc[api_name] = item
            in [false, false, _]
              great_success &&= item.nil?
            end
          in [true, false]
            great_success = false
          in [false, false]
            nil
          end
        end

        keys.each do |key|
          acc[key] = value.fetch(key)
        end

        great_success ? [true, new(acc), tally] : [false, true, tally]
      end
    end

    # Returns the raw value associated with the given key, if found. Otherwise, nil is
    #   returned.
    #
    #   It is valid to lookup keys that are not in the API spec, for example to access
    #   undocumented features. This method does not parse response data into
    #   higher-level types. Lookup by anything other than a Symbol is an ArgumentError.
    #
    # @param key [Symbol]
    #
    # @return [Object, nil]
    def [](key)
      unless key.instance_of?(Symbol)
        raise ArgumentError.new("Expected symbol key for lookup, got #{key.inspect}")
      end

      @data[key]
    end

    # Returns a Hash of the data underlying this object. O(1)
    #
    #   Keys are Symbols and values are the raw values from the response. The return
    #   value indicates which values were ever set on the object. i.e. there will be a
    #   key in this hash if they ever were, even if the set value was nil.
    #
    #   This method is not recursive. The returned value is shared by the object, so it
    #   should not be mutated.
    #
    # @return [Hash{Symbol=>Object}]
    def to_h = @data

    alias_method :to_hash, :to_h

    # @param keys [Array<Symbol>, nil]
    #
    # @return [Hash{Symbol=>Object}]
    def deconstruct_keys(keys)
      (keys || self.class.known_fields.keys).filter_map do |k|
        unless self.class.known_fields.key?(k)
          next
        end

        [k, method(k).call]
      end
      .to_h
    end

    # Create a new instance of a model.
    #
    # @param data [Hash{Symbol=>Object}, AcmeAISDK::BaseModel]
    def initialize(data = {})
      case AcmeAISDK::Util.coerce_hash(data)
      in Hash => coerced
        @data = coerced.to_h do |key, value|
          name = key.to_sym
          mapped = self.class.reverse_map.fetch(name, name)
          type = self.class.fields[mapped]&.fetch(:type)
          stored =
            case [type, value]
            in [Module, Hash] if type <= AcmeAISDK::BaseModel
              type.new(value)
            in [AcmeAISDK::ArrayOf, Array] | [AcmeAISDK::HashOf, Hash]
              type.coerce(value)
            else
              value
            end
          [name, stored]
        end
      else
        raise ArgumentError.new("Expected a #{Hash} or #{AcmeAISDK::BaseModel}, got #{data.inspect}")
      end
    end

    # @return [String]
    def to_s = @data.to_s

    # @return [String]
    def inspect
      "#<#{self.class.name}:0x#{object_id.to_s(16)} #{deconstruct_keys(nil).map do |k, v|
        "#{k}=#{v.inspect}"
      end.join(' ')}>"
    end
  end
end
