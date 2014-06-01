class ConsumerFinanceDataImporter
  # Meant to import source dataset from:
  # https://data.consumerfinance.gov/dataset/Consumer-Complaints/x94z-ydhh?

  class << self
    def import(file_name, state_list = nil)
      data = read_file(file_name)
      doc = Nokogiri::XML::Document.parse(data)
      doc.xpath("//response//row//row").each do |row|
        process_row(row, state_list)
      end
    end

    private
      def process_row(row, state_list = nil)
        state_node = row.at_xpath(".//state")
        if state_node.nil?
          return
        else
          state = state_node.text
        end

        if state_list.nil? 
          create_complaint_from_row(row)
        elsif state_list.include?(state)
          create_complaint_from_row(row)
        end 
      end

      def create_complaint_from_row(row)
        ConsumerComplaint.new.tap do |cc|
          if row.at_xpath(".//complaint_id")
            cc.consumer_finance_gov_ref_num = row.at_xpath(".//complaint_id").text
          end

          if row.at_xpath(".//product")
            cc.product = row.at_xpath(".//product").text
          end

          if row.at_xpath(".//sub_product")
            cc.sub_product = row.at_xpath(".//sub_product").text
          end

          if row.at_xpath(".//company")
            cc.company = row.at_xpath(".//company").text
          end

          if row.at_xpath(".//issue")
            cc.issue = row.at_xpath(".//issue").text
          end

          if row.at_xpath(".//state")
            cc.state = row.at_xpath(".//state").text
          end

          if row.at_xpath(".//zip_code")
            cc.zip_code = row.at_xpath(".//zip_code").text
          end

          if row.at_xpath(".//submitted_via")
            cc.submission_channel = row.at_xpath(".//submitted_via").text
          end

          if row.at_xpath(".//date_received")
            cc.received_on = Date.parse(row.at_xpath(".//date_received").text)            
          end

          if row.at_xpath(".//date_sent_to_company")
            cc.sent_to_company_on = Date.parse(row.at_xpath(".//date_sent_to_company").text)
          end

          if row.at_xpath(".//company_response")            
            cc.company_response = row.at_xpath(".//company_response").text
          end

          if row.at_xpath(".//timely_response")
            cc.timely_response = (row.at_xpath(".//timely_response").text == "Yes")
          end

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
