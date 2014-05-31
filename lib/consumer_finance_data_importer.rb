class ConsumerFinanceDataImporter
  class << self
    def import(file_name)
      data = read_file(file_name)
      doc = Nokogiri::XML::Document.parse(data)
      doc.xpath("//response//row//row").each do |row|
        create_consumer_finance_model_from_row(row)
      end
    end

    private
      def create_consumer_finance_model_from_row(row)
        ConsumerComplaint.new.tap do |cc|
          cc.consumer_finance_gov_ref_num = row.at_xpath(".//complaint_id").text
          cc.product = row.at_xpath(".//product").text
          cc.sub_product = row.at_xpath(".//sub_product").text
          cc.company = row.at_xpath(".//company").text
          cc.issue = row.at_xpath(".//issue").text
          cc.state = row.at_xpath(".//state").text
          cc.zip_code = row.at_xpath(".//zip_code").text
          cc.submission_channel = row.at_xpath(".//submitted_via").text
          cc.received_on = Date.parse(row.at_xpath(".//date_received").text)
          cc.sent_to_company_on = Date.parse(row.at_xpath(".//date_sent_to_company").text)
          cc.company_response = row.at_xpath(".//company_response").text
          cc.timely_response = (row.at_xpath(".//timely_response").text == "Yes")
          cc.save
        end
      end

      def read_file(file_name)
        file = File.open(file_name, "r")
        data = file.read
        file.close
        return data
      end
    end
  end
