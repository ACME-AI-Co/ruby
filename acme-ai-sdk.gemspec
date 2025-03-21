# frozen_string_literal: true

require_relative "lib/acme-ai-sdk/version"

Gem::Specification.new do |s|
  s.name = "acme-ai-sdk"
  s.version = AcmeAISDK::VERSION
  s.summary = "Ruby library to access the Acme AI SDK API"
  s.authors = ["Acme AI SDK"]
  s.email = "support@example.com"
  s.files = Dir["lib/**/*.rb", "rbi/**/*.rbi", "sig/**/*.rbs", "manifest.yaml"]
  s.extra_rdoc_files = ["README.md"]
  s.required_ruby_version = ">= 3.0.0"
  s.add_dependency "connection_pool"
  s.homepage = "https://gemdocs.org/gems/acme-ai-sdk"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/stainless-sdks/acme-ai-sdk-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
end
