class XmlParser
  attr_accessor :raw_document, :document, :document_root, :root

  def initialize(document, opts= {})
    @raw_document = doc_to_string(document)
    @document = read(document, opts)
    @document_root = @document.root
    @root = @document.root
  end

  def document_text(opts = {})
    @raw_document.to_s.tap do |doc|
      masked_tags = opts[:mask] || []
      masked_tags.each do |tag|
        doc.gsub!(/<#{tag}>(.)*<\/#{tag}>/, "<#{tag}>MASKED</#{tag}>")
      end
    end
  end

  def set_root(path)
    @root = document.at_xpath(path)
    self
  end

  def root_node
    Node.new(root)
  end

  def select_node(path)
    Node.new(root.at(path))
  end

  class Node
    attr_accessor :object, :value

    def initialize(object)
      @object = object
      @value = node_text(object)
    end

    def to_text
      value.blank? ? nil : value
    end

    def to_masked_text
      value.blank? ? nil : 'X' * (value.size - 4) + value[-4, 4]
    end

    def to_decimal
      value.blank? ? nil : BigDecimal.new(value)
    end

    def to_percentage
      value.blank? ? nil : percentage_to_decimal(value)
    end

    def to_integer
      value.blank? ? nil : value.to_i
    end

    def to_money
      value.blank? ? nil : Money.new(value.gsub(/\D/, ''), "USD")
    end

    def to_date(formatter = "%m/%d/%Y")
      value.blank? ? nil : Date::strptime(value, formatter)
    end

    def to_boolean
      value.blank? ? nil : ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(value)
    end

    def matches?(match)
      value.blank? ? nil : value == match
    end

    def mask_tag(tag)
      raw_xml = object.to_xml
      raw_xml.gsub!(/<#{tag}>(.)*<\/#{tag}>/, "<#{tag}>MASKED</#{tag}>")
      raw_xml
    end

    def node_text(node)
      node.nil? ? "" : node.inner_text.strip
    end

    def percentage_to_decimal(string)
      string.gsub!(/\D/, '').to_d / BigDecimal.new("100")
    end
  end

private
  def doc_to_string(doc)
    doc.is_a?(String) ? doc : File.open(doc).read
  end

  def read(doc, opts = {})
    if opts[:remove_namespaces]
      Nokogiri::XML(doc).remove_namespaces!
    else
      Nokogiri::XML(doc)
    end
  end
end