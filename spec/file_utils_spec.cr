require "./spec_helper"

fixture_zip_file_path = "spec/fixtures/zip_file.zip"
describe Epub::FileUtils do
  it "unzip file" do
    dest = Epub::FileUtils.unzip(fixture_zip_file_path)
    sample001_file_path = File.join(dest, "zip_file", "001.txt")
    sample_folder_path = File.join(dest, "zip_file", "folder")
    sample002_file_path = File.join(dest, "zip_file", "folder", "002.txt")

    raw_sample001_file_path = "spec/fixtures/zip_file/001.txt"
    raw_sample002_file_path = "spec/fixtures/zip_file/folder/002.txt"

    Dir.exists?(dest).should be_true

    File.exists?(sample001_file_path).should be_true
    File.exists?(sample002_file_path).should be_true
    Dir.exists?(sample_folder_path).should be_true

    File.read(sample001_file_path).should eq File.read(raw_sample001_file_path)
    File.read(sample002_file_path).should eq File.read(raw_sample002_file_path)

    FileUtils.rm_r(dest)
  end
end
