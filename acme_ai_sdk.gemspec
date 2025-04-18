# frozen_string_literal: true

require_relative "lib/acme_ai_sdk/version"

Gem::Specification.new do |s|
  s.name = "acme-ai-sdk"
  s.version = AcmeAISDK::VERSION
  s.summary = "Ruby library to access the Acme AI SDK API"
  s.authors = ["Acme AI SDK"]
  s.email = "support@example.com"
  s.homepage = "https://gemdocs.org/gems/acme-ai-sdk"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/ACME-AI-Co/ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.0.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "connection_pool"
end
