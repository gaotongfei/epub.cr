require "./spec_helper"

epub_folder_path = "spec/fixtures/wasteland"
epub_file_path = "spec/fixtures/wasteland.epub"

describe Epub::Document do
  it "parse xml" do
  end

  it "get root opf file path" do
    document = Epub::Document.new(epub_folder_path)
    document.root_opf_path.should eq "EPUB/wasteland.opf"
  end

  it "get root opf file path from epub file" do
    document = Epub::Document.new(epub_file_path)
    document.root_opf_path.should eq "EPUB/wasteland.opf"
  end

  it "get metadata" do
    document = Epub::Document.new(epub_folder_path)
    metadata = document.metadata
    metadata["identifier"].should eq "code.google.com.epub-samples.wasteland-basic"
    metadata["title"].should eq "The Waste Land"
    metadata["language"].should eq "en-US"
    metadata["date"].should eq "2011-09-01"
    metadata["rights"].should eq "This work is shared with the public using the Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) license."
  end

  it "get metadata from epub file" do
    document = Epub::Document.new(epub_file_path)
    metadata = document.metadata
    metadata["identifier"].should eq "code.google.com.epub-samples.wasteland-basic"
    metadata["title"].should eq "The Waste Land"
    metadata["language"].should eq "en-US"
    metadata["date"].should eq "2011-09-01"
    metadata["rights"].should eq "This work is shared with the public using the Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) license."
  end
end
