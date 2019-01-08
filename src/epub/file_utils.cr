module Epub
  class FileUtils
    def self.unzip(filepath : String) : String
      dest = dest()

      ::FileUtils.mkdir_p(dest)

      File.open(filepath) do |file|
        Zip::Reader.open(file) do |zip|
          zip.each_entry do |entry|
            if entry.dir?
              create_dir(dest, entry.filename)
            elsif entry.file?
              create_file(dest, entry.filename, entry.io)
            end
          end
        end
      end

      dest
    end

    private def self.dest : String
      # TODO: support Windows ;)
      "/tmp/#{Random::Secure.hex(8)}"
    end

    private def self.create_dir(dest : String, path : String)
      ::FileUtils.mkdir_p(File.join(dest, path))
    end

    private def self.create_file(dest : String, path : String, io : IO)
      # create non-existing intermediate directories
      ::FileUtils.mkdir_p(File.join(dest, File.dirname(path)))

      File.write(File.join(dest, path), io)
    end
  end
end