# frozen_string_literal: true

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) && caller.chain([$0]).chain(ARGV).grep(/tapioca/)
  Warning.warn(
    <<~WARN
      \n
      ⚠️ skipped loading of "acme-ai-sdk" gem under `tapioca`.

      This message is normal and expected if you are running a `tapioca` command, and does not impact `.rbi` generation.
      \n
    WARN
  )
  return
end

# Standard libraries.
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"

# Gems.
require "connection_pool"

# Package files.
require_relative "acme-ai-sdk/version"
require_relative "acme-ai-sdk/util"
require_relative "acme-ai-sdk/base_model"
require_relative "acme-ai-sdk/base_page"
require_relative "acme-ai-sdk/request_options"
require_relative "acme-ai-sdk/errors"
require_relative "acme-ai-sdk/base_client"
require_relative "acme-ai-sdk/pooled_net_requester"
require_relative "acme-ai-sdk/client"
require_relative "acme-ai-sdk/models/file_file_create_params"
require_relative "acme-ai-sdk/models/file_file_create_response"
require_relative "acme-ai-sdk/models/file_file_search_params"
require_relative "acme-ai-sdk/models/file_file_search_response"
require_relative "acme-ai-sdk/models/file_fileslist_params"
require_relative "acme-ai-sdk/models/file_fileslist_response"
require_relative "acme-ai-sdk/resources/files"
