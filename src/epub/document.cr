module Epub
  class Document
    getter path : String

    def initialize(@path : String)
    end

    def metadata
      xml_content = File.read(File.join(path, root_opf_path))

      Epub::Metadata.new(xml_content)
    end

    def root_opf_path
      doc = read_container_file

      doc.xpath("//xmlns:rootfile", namespaces: doc.root.not_nil!.namespaces).as(XML::NodeSet)[0]["full-path"]
    end

    private def read_container_file
      XML.parse(File.read(File.join(path, "META-INF", "container.xml")))
    end
  end
end
