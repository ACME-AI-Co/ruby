#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strict

require "acme-ai-sdk"
require "fileutils"
require "time"

# Initialize the client with a bearer token
# Default is ENV["ACME_AI_SDK_BEARER_TOKEN"] and can be omitted if set
client = AcmeAISDK::Client.new(
  bearer_token: ENV["ACME_AI_SDK_BEARER_TOKEN"]
)

# Create a file upload
file = File.open("birds.csv")
file_response = client.files.file_create({file: file})

file_id = "file_123"

# Poll for file processing completion
loop do
  files_response = client.files.fileslist
  found = files_response.files.select { |f| f.file_id == file_id }

  # Break when file is completed
  if found && found.status == AcmeAISDK::Models::FileFileslistResponse::File::Status::COMPLETED
    break
  end

  # Wait before checking again
  sleep(1)
end

# Search the file for a specific query
search_results = client.files.file_search(
  file_id,
  query: "chickadee"
)

# Output search results
puts search_results.inspect
