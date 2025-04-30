# frozen_string_literal: true

require_relative "../test_helper"

class AcmeAISDK::Test::Resources::FilesTest < AcmeAISDK::Test::ResourceTest
  def test_file_create_required_params
    skip("skipped: tests are disabled for the time being")

    response = @acme_ai_sdk.files.file_create(file: Pathname(__FILE__))

    assert_pattern do
      response => AcmeAISDK::Models::FileFileCreateResponse
    end

    assert_pattern do
      response => {
        file_id: String | nil,
        status: AcmeAISDK::Models::FileFileCreateResponse::Status | nil,
        upload_time: Time | nil
      }
    end
  end

  def test_file_search_required_params
    skip("skipped: tests are disabled for the time being")

    response = @acme_ai_sdk.files.file_search("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", query: "query")

    assert_pattern do
      response => AcmeAISDK::Models::FileFileSearchResponse
    end

    assert_pattern do
      response => {
        file_id: String | nil,
        metadata: AcmeAISDK::Models::FileFileSearchResponse::Metadata | nil,
        query: String | nil,
        results: ^(AcmeAISDK::Internal::Type::ArrayOf[AcmeAISDK::Models::FileFileSearchResponse::Result]) | nil,
        total_results: Integer | nil
      }
    end
  end

  def test_fileslist
    skip("skipped: tests are disabled for the time being")

    response = @acme_ai_sdk.files.fileslist

    assert_pattern do
      response => AcmeAISDK::Models::FileFileslistResponse
    end

    assert_pattern do
      response => {
        files: ^(AcmeAISDK::Internal::Type::ArrayOf[AcmeAISDK::Models::FileFileslistResponse::File]) | nil,
        limit: Integer | nil,
        offset: Integer | nil,
        total: Integer | nil
      }
    end
  end
end
