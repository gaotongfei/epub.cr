module Epub
  class Metadata
    getter metadata : XML::Node
    getter document : XML::Node

    def initialize(@xml : String)
      @document = XML.parse(@xml)
      @metadata = @document.xpath("//xmlns:metadata",
                  namespaces: @document.root.not_nil!.namespaces).as(XML::NodeSet)[0]
    end

    def [](key : String) : String
      metadata.xpath("//dc:#{key}", namespaces: {"dc" => ns }).as(XML::NodeSet)[0].content
    end

    private def ns
      "http://purl.org/dc/elements/1.1/"
    end

  end
end