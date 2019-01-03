class Document
  getter path : String

  def initialize(@path : String)
  end

  def read
    File.open(path) do |file|
      Zip::Reader.open(file) do |zip|
        zip.each_entry do |entry|
          p entry.filename
        end
      end
    end

  end

end