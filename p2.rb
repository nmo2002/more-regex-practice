def parse_invoices(invoice_data)
  invoice_data.each_line do |line|
    data = line.match(/(\d{4}-\d{2}-\d{2}) - ([\w\d]+) - ([\w\s]+) - \$(\d+)/)
    if data != nil
      date = data[1]
      invoice_number = data[2]
      client_name = data[3]
      amount = data[4]
      puts "Date: #{date}, Invoice Number: #{invoice_number}, Client: #{client_name}, Amount: $#{amount}"
    else
      puts "Invalid invoice entry: #{line}"
    end
  end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)
